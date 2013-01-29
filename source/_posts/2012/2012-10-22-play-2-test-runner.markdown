---
layout: post
title: "play 2 JUnit runner"
date: 2012-10-22 17:38
comments: true
categories: 
- Play
- TDD
- testing
- junit
published: true
---

I like Play 2. It's simply the best thing that happened on the JVM since, well, Play 1 :)   

One thing bothers me though: testing is still a bit of a PITA (at least in Java). Sure, Play 2 has webdriver support, you don't have to extend `UnitTest` and `FunctionalTest` anymore and you can unit-test templates. But, instead of extending base test classes I have to call a bunch of static utility methods on the `play.test.Helpers` class.   

For example, to write a test that runs inside an application (i.e. has access to its environment), I have to write the following: 

<script src="https://gist.github.com/3917715.js?file=BeforeOrganisationTest.java"></script>


In his excellent [blog post](http://blog.matthieuguillermin.fr/2012/03/unit-testing-tricks-for-play-2-0-and-ebean/), Matthieu Guillermin ([@mguillermin](https://twitter.com/MGuillermin)) shows a solution for this problem (amongs others) by creating an abstract base class that contains the boilerplate code. 
This works very well, but I prefer composition over inheritance, so I'm using a custom JUnit runner for this.       
 
<script src="https://gist.github.com/3917715.js?file=PlayJUnitRunner.java"></script>

Then, you can use this runner in an `@runWith` annotation, and just write your test code without wrapping it in a `Runnable`, like so: 

<script src="https://gist.github.com/3917715.js?file=AfterOrganisationTest.java"></script>

Until next time!  