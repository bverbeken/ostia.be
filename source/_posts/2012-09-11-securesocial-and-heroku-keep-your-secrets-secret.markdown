---
layout: post
title: "Play2 and SecureSocial on Heroku, and how to keep your secrets secret"
date: 2012-09-11 00:19
comments: true
categories: 
- playframework
- securesocial
- heroku
- deployment
published: false
---

I'm a contributor on an open source project called [modules.playframework.org](https://github.com/play-modules/modules.playframework.org), a public module repository for playframework that is to replace the [existing page](http://www.playframework.org/modules) in the near future. 
We're using the the new [SecureSocial](https://github.com/jaliss/securesocial) module for play2 by the ever  helpful Jorge (aka [@jaliss](https://twitter.com/jaliss)) to allow people to log in using their twitter, facebook, google and linkedin accounts. 

Being an open source project does mean that the source (and configuration) is out in the open. Our users will tell twitter that our app is to be trusted, and that trust is based on a secret api key. We definitely need to keep that key secret, or any other web app can use the same key and pretend to be us.     
Also, if these variables are called 'consumerSecret' or 'clientSecret', that's a clue ;) 

In short, we want to push our code to github without publishing the secret keys, but on the other hand we also want to deploy/push to heroku with the keys. In this post, I'll show you how we solved this problem without the need for a separate branch and without sacrificing the simplicity of `git push heroku`.

<!-- more -->

The problem is you can't have separate .gitignore files for different git remotes. Maintaining separate branches would solve the problem, but that just feels clunky.   
The solution, obviously, is to use environment variables. Here's how to do that with play2 and heroku. 


securesocial.conf
------------------

We have a separate config file for securesocial related stuff, called securesocial.conf. It's imported in the `application.conf` file using 

``` yml application.conf
	include "securesocial.conf"

```

The `securesocial.conf` file itself looks like this: 

``` yml securesocial.conf
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

	    # add more for facebook, linkedin etc here
	}

```	

Note: the '?' is important. All placeholders should look like this: **${?PLACEHOLDER}** 

Set Heroku environment variables
---------------------------------
Next, in order to make these variables resolve, you need to tell Heroku about them. Here's how: 

	heroku config:add TWITTER_CONSUMER_KEY=sup3rs3cr3t TWITTER_CONSUMER_SECRET=e43nm0r3s3crt

This will set the environment variables, increase the version number of your dyno and restart it. 
Story done!

