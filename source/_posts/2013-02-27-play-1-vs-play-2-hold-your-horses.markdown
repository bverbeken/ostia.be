---
layout: post
title: "Play 1 vs Play 2: Hold Your Horses"
date: 2013-02-27 21:48
categories: playframework cegeka TDD agile java scala 
comments: true
---

I work for Cegeka, a company that's proud of not being the regular type of body-shopping consulting firm. Instead, they put together teams of highly skilled, agile-minded people and sell those to clients as a whole. Needless to say I like it there. 

Self-improvement is an important part in their philosophy, and in order to do that Cegeka encourages people to participate in so-called *Competence Centers*. These are groups of people of the same profession - Spotify would call them [*guilds*](http://blog.crisp.se/2012/11/14/henrikkniberg/scaling-agile-at-spotify) - who gather a full day about every two months. Kind of like a playground to learn about technology, if you will.    
Since about a year, I've been in charge of the [Playframework](http://www.playframework.com/) competence center, whose goal it is to investigate how well Play fits the [agile](http://agilemanifesto.org/)-[TDD](http://en.wikipedia.org/wiki/Test-driven_development)-[DDD](http://www.infoq.com/presentations/model-to-work-evans) way of working, and whether the playframework elevator pitch holds in a more or less real-life project.         

<!-- more -->


*(Heads up: the following is the reflection of what the competence center members thought as a team, so they are not (exclusively) my own thoughts.)*

What we did
-----------
We held 6 sessions throughout the year, during which we built an application from scratch. The app, *Hold Your Horses* (<https://github.com/cegekaplaycc/>), is a horse race simulation game in which players can buy and sell horses, build stables, buy food, hire trainers, participate in races, win money, you name it.    
In fact, we built *Hold Your Horses* twice, and here's the interesting part: we evaluated both Play 1 (4 sessions) and Play 2 with java (2 sessions).     
When we held the first session back in January 2012, Play 2 had been announced and an RC was available, but the documentation wasn't there yet. So we decided to go with Play 1 for starters and to switch to Play 2 after a few sessions. This would give us the opportunity to compare the two and decide for ourselves. 

Development-process-wise, we tried to keep as close as possible to the agile way of working we're used to at Cegeka: story cards and mock-ups were prepared beforehand ([Trello](https://trello.com/) rocks, btw!), these stories would get picked up by a pair, who'd implement the story in a test-driven way. However, we stayed away from estimates and story point tracking, which would've just increased the overhead.

In retrospect
-------------------
Last week at the end of the sixth session, we decided to do a retrospective, being good agileists and all. The main question was: what do we think of Play, and where do we go from here. 

First we did a little SWOT analysis: I asked everyone to write down what they feel are Play's strengths, weaknesses, opportunities and threats on post-its. Surprise or not, we mostly agreed. Here's what the team wrote down (most of the items are for Play in general, some are about Play 1 and Play 2 specifics): 

** Strengths: **

* Play is innovative
* easy to deploy
* No servlets, really fast setup
* Fast setup (5x)
* No redeploy necessary, hit F5 and see result
* Hot deploy
* Play is stateless (4x)
* easy to deploy in the cloud (Heroku)
* Play app structure is easy to understand, it's easy to find your way
* Templating system is fun for easy things, but we haven't built any really complicated screens yet
* Play1 specific
	* flat learning curve
	* speed of development
* Play2 specific
	* the routes file is compiled

** Weaknesses: **

* technical problems, things that don't work as they are supposed to 
* Documentation (3x)
* Things go quickly, until you hit a problem. Googleing for a solution doesn't help
* Play vs Eclipse
* using play results in badly tested code
* testability, running tests from within the IDE != easy. Result: hard to do TDD
* Testing != easy. Perhaps to do with our lack of knowledge?
* About Play 1
	* auto-magical stuff (enhancers etc)
* About Play 2
	* Sbt != easy
	* bad java support in Play 2


** Opportunities: **

* get to know HTML(5) and http better
* It's really different from what we're used to
* Let's revive Play 1, go back to easy and fast of Play 1
* Play 2 + Scala = a hype. Enterprise Java killer? 

** Threats: **

* Too (?) innovative
* Play 2 core is written in Scala
* EBean is not simple and has bugs (e.g. getter and setter needed, even for public id field)
* Play 2 templates: steep learning curve
* Play 2: too many new things to be easy to learn
* Java devs are left in the cold
* Play 1 is dead, Play 2 for java != Ok (both a threat as an opportunity)
* No best practices concerning packaging and layering. Play is only suited for small projects?


What we think
-------------

We know we like Play 1 a lot. Being a java framework, it's right in our comfort zone, and we can read, understand and debug through the framework code.    
We love the statelessness of the framework; development is really fast thanks to hit-F5-and-it's-there, and it makes it easy to deploy to the cloud. Furthermore, the learning curve is flat, because of the simple conventions and known technologies under the hood (hibernate, for one).   
On the testing side, things could be improved. Either we don't really understand how we should test a stateless web app (lack of knowledge), or Play 1 lacks the tools to do so. The fact that there's so much static things going on doesn't help, but not a major hurdle. 

Play 2 is a different story. The main ideas we knew from Play 1 are there (statelessness, the routes file, the MVC approach), but there are just too many things to learn to make it easy to use right away. We didn't like EBean, and struggled with the compiled templates and sbt, both of which feel very un-java-like (I hear you thinking: Duh, of course they do. More on that below ;)).   

All in all, we now know what Playframework can do for us, there's definitely value there, but Play 2 with Java just doesn't feel right to us.   
Or, as someone put it: "We should fork Play 1" (which btw has been [done](http://www.github.com/yalpframework/yalp) by now).

Where we're heading
------------------- 
One question remains, though: until now, we used Java. Is our gut feeling correct; is Play 2 a better fit for Scala than it is for Java?    
Of course there's only one way to find out, so we're going to build yet another app, using Play 2 + Scala this time. (Might not be *Hold Your Horses* though, we're sick of horses by now).

We know it's going to be tough; most of us have only touched scala briefly through the [Coursera](https://www.coursera.org/course/progfun) course, or not at all. But we wouldn't be good developers if we weren't ready to step out of our comfort zone, now would we.   
On the other hand, it's going to be fun too, we're planning a [scalatron](http://scalatron.github.com/) battle as we speak.  

What do you think? Are there hard and easier ways to learn a language like Scala? Things we should/shouldn't do?    
