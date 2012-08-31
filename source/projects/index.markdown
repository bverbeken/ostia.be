---
layout: page
title: "Projects"
comments: false
sharing: false
footer: true
---


Litmus
-------------
Litmus is a module for PlayFramework (1.2.x) that allows for more expressive functional testing. 
More info can be found here: <http://github.com/bverbeken/litmus>

####Installation

First, add the following dependencies to your `dependencies.yml` file: 
	require:
		...
		- litmus                    -> litmus 0.2.3
		# transitive dependencies for litmus 		
    	- org.easytesting           -> fest-assert     1.4
    	- org.jsoup                 -> jsoup           1.6.1
    	- org.seleniumhq.selenium   -> selenium-java   2.21.0
    	- com.google.guava          -> guava 11.0.2
    	...

Note: you also need to declare the transitive dependencies in your own `dependencies.yml` file! This is because of a known problem with the play 1.x dependency management, more info [here](https://play.lighthouseapp.com/projects/57987-play-framework/tickets/1108-transitive-dependencies-not-work-with-modules-from-non-default-repository).

Secondly, you also need to declare the remote repository (<http://ostia.be/repo/>)

	repositories:
    	- ostia.be:	
        	type:       http
        	artifact:   "http://ostia.be/repo/[module]-[revision].zip"
        	contains:
            	- litmus  -> *

After that, a simple 

	play deps --sync

is all you need to get you rolling. 



Mockups
---------
A PlayFramework module that allows you to put your html mockups (aka wireframes) in a specified folder under your Play project. 


####Installation
To install this module, you just need to add the following to your `/conf/dependencies.yml` file: 

	require: 
		...
		- mockups -> mockups 0.2
		...

And of course declare the remote repository		

	repositories:
    	- ostia.be:	
        	type:       http
        	artifact:   "http://ostia.be/repo/[module]-[revision].zip"
        	contains:
            	- mockups -> *

Just do `play deps --sync` now, and start creating your mockups.