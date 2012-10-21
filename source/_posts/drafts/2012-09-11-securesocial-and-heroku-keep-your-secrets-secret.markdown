---
layout: post
title: "Play2, SecureSocial, Heroku, and how to keep your secrets secret"
date: 2012-09-11 00:19
comments: true
categories: 
- playframework
- securesocial
- heroku
- deployment
published: false
---

I'm a contributor on an open source project called [modules.playframework.org](https://github.com/play-modules/modules.playframework.org), a public module repository for playframework that is to replace the [existing modules page](http://www.playframework.org/modules). 
We're using the new [SecureSocial](https://github.com/jaliss/securesocial) module for play2 by the ever helpful Jorge ([@jaliss](https://twitter.com/jaliss)) so that people to log in using 
their twitter, facebook, google and linkedin accounts. 

Being an open source project does mean that the source (and configuration) is out in the open. However, some things are better kept secret, such as secret api keys (if the variable name contains the word 'secret', that's a clue ;)). 

So, we want to push our code to github without publishing the secret keys. On the other hand we also want to deploy a working app on Heroku.      
In this post I'll show you how we kept our secrets secret, without the need for a separate git branch and without sacrificing the simplicity of `git push heroku`, by splitting up our development and production configuration, and by using Heroku's environment variables. 

<!-- more -->

Split up configuration for development and production
-----------------------------------------------------
Play2 allows you to 'include' configuration files and to override previously defined properties.     
To keep things simple and safe, we'll keep our development configuration in the default `/conf/application.conf` file, and override what's necessary in a separate `/conf/production.conf` file.    
If you do it the other way around, you could forget to override production settings in dev, and end up fcking up things in production.  I've seen it happening multiple times, especially when running automated integration tests ;)    
Of course, this goes for any staging environment in between as well. 

XXX
Splitting up your development and production configuration is obviously useful for many things: db configuration, logging, you name it.    


This is what our production configuration looks like: 

``` yml production.conf
	
	# include the default configuration
	include "application.conf"	

	securesocial {
	
	    onLoginGoTo=/
	    onLogoutGoTo=/

	    twitter {
	        requestTokenUrl="https://api.twitter.com/oauth/request_token"
	        accessTokenUrl="https://api.twitter.com/oauth/access_token"
	        authorizationUrl="https://api.twitter.com/oauth/authorize"
	        consumerKey=${?TWITTER_CONSUMER_KEY}
	        consumerSecret=${?TWITTER_CONSUMER_SECRET}
	    }

	 	#   ... more configuration for facebook, linkedin etc. ...
	}


```

Note that consumerKey and consumerSecret properties are defined as `${?VAR_NAME}`. Don't worry, that's part of the plan. Later on we'll configure those in environment variables on Heroku. The point is that the actual secrets won't be pushed to your git remotes. 

Our `application.conf` file also configures the Secure Social module: 

``` yml application.conf
	
	#	... other usual configuration for play, such as loggers, db conf, etc. 


	securesocial {

	    onLoginGoTo=/
	    onLogoutGoTo=/

	    twitter {
	        requestTokenUrl="https://api.twitter.com/oauth/request_token"
	        accessTokenUrl="https://api.twitter.com/oauth/access_token"
	        authorizationUrl="https://api.twitter.com/oauth/authorize"
	        consumerKey=ZgO1k57cxgodmNFa8Vkfg
	        consumerSecret=HVchVmadIZcZnxZdOTr1S2gkwDdk64XzY3DxWMg9Xg
	    }

	     google {
	        authorizationUrl=WONT_WORK
	        accessTokenUrl=WONT_WORK
	        clientId=WONT_WORK
	        clientSecret=WONT_WORK
	        scope=WONT_WORK
	    }

	    facebook {
	        authorizationUrl=WONT_WORK
	        accessTokenUrl=WONT_WORK
	        clientId=WONT_WORK
	        clientSecret=WONT_WORK
	        scope=WONT_WORK
	    }

	    linkedin {
	        requestTokenUrl=WONT_WORK
	        accessTokenUrl=WONT_WORK
	        authorizationUrl=WONT_WORK
	        consumerKey=WONT_WORK
	        consumerSecret=WONT_WORK
	    }

	}

```

Two important things to note here: 

* When running the application without loading the `production.conf` file, we'll only be able to use twitter to log in, since the google, facebook and linkedin secrets are missing here. However, we do need to 'configure' them, since Secure Social needs every provider to be loaded as a plugin in the `play.plugins` file, and that file is the same for development and production. 
* We configure the Twitter provider with keys from a twitter app that was specifically created for testing purposes, found [here](http://foobla.com/faqs/obsocialsubmit/twitter-apps-for-testing.html). We could've done that for the other providers as well, but we just didn't :)

Setup Heroku
------------
Last step: we want Heroku to tell Play to use the `production.conf` file on startup. That's what the `Procfile` is for (as descibed [here](http://www.playframework.org/documentation/2.0.3/ProductionHeroku)).      
Just add `-Dconfig.resource=production.conf` and you're done.    
As an alternative, you could also load your production config from an external file or an url (see the [docs](http://www.playframework.org/documentation/2.0.3/ProductionConfiguration)). 

Finally, in order to make the variables in our `production.conf` resolve, you need to tell Heroku about them, from the command line. Like so: 

	heroku config:add \
		TWITTER_CONSUMER_KEY=yourRealKey \
		TWITTER_CONSUMER_SECRET=yourRealSecret \
		other keys

This will set the environment variables, increase the version number of your dyno and restart it. 
Story done!
