---
layout: post
title: "Devoxx University highlights"
date: 2012-11-14 12:49
comments: true
categories: 
- devoxx
- conference
- playframework 
- ceylon
- angularjs
- scala
published: true
---


It's that time of the year again: Devoxx, Antwerp, the largest independent all things JVM conference. Not 'Java' anymore, because obviously there are many things going on, and I didn't attend a single java(-only) flavoured talk in my whole first day.  
Some highlights.

<!-- more -->

Day 1
============
 

PlayFramework
---------------
In the morning: the **Playframework crash course**. What else.   
First, [Peter Hausel](https://twitter.com/pk11) touched a lot of interesting topics for experienced play developers (love the splitting up of routes files in the upcoming Play 2.1!). However, I do think his talk was scheduled a bit oddly by the organisation. His other talk in the late afternoon which I attended as well, was an half-hour demo of how to build a Play 2 app from the ground up, and my feeling is that more people would've enjoyed his first talk after seeing his second. 
During the second part of the crash course [Sadek Drobi](https://twitter.com/sadache) and [Guillaume Bort](https://twitter.com/guillaumebort) presented Play 2 as a tool for realtime web (RTW) programming. I've seen them giving talks a couple of times now, and it amazes me how they keep putting new things in their presentations. 

Ceylon Lab
----------
In the afternoon, I participated in the **Write your first Ceylon programme with the language authors** (Emmanuel Bernard, Gavin King & Stéphane Epardaud). Glad I did, Ceylon - which is pronounced more as *salon* than as *say lon* - has some interesting features, but most interesting is the type system. with features like *union types*, which allow you to write things like

```
void doSomething(Integer|String aVar){
	if (is Integer aVar){
		// here aVar is of type Integer
	} else if (is String aVar){
		// here aVar is if type String
	}
}
```

Not sure how dangerous this is in real life projects, but at least it's an interesting idea to think about.

Personal musing: I like that the ceylon guys used Playframework to *Ceylon Herd*, which is what the Ceylon module repository is called.  

Scala Enthusiasts Gathering (aka The Scala Bof)
-----------------------------------------------
Yet another highlight on the first day was the Scala enthusiasts gathering. To keep things light, Renato Cavalcanti ([@renatocaval](https://twitter.com/renatocaval)) and his team decided to make it a panel discussion with some high profile people from the scala world. 
It wasn't a really focused discussion, but that didn't matter as it allowed to cover lots of different topics. 
And there was good belgian quality beer, thanks for that, [@be_scala](https://twitter.com/be_scala)! 

Day 2
===========

More Scala
----------
I planned to go to the OpenJDK bugathon, but I came in way too late thanks to belgian traffic.   
so I missed the OpenJDK Hack Session I planned to attend (no java, again, this is becoming a pattern) and I went to follow the rest of **Scala advanced concepts and best practices** by Dick Wall and Bill Venners. 
A couple of quotes: 

{% blockquote Dick Wall, about using "x & 1" instead of ] "x % 2" to check whether a number is even or not %}
Yes, it's an evil premature optimization, but it's a neat one.
{% endblockquote %}

{% blockquote %}
This is the zen-slide
{% endblockquote %}

{% blockquote %}
Syntax coloring in IDE: turn your vars red
{% endblockquote %}

AngularJs
------------
In the afternoon: the AngularJs lab. Awesome technology, I'm definitely going to check that out for an upcoming project we're planning. (Right, Matti? :))


Conclusion
============
That's it for the Devoxx University. Two down, three to go. I'm looking forward to tonight's PlayBe meetup, 7pm at the Axxess Café, right next to the metropolis main entrance.    
Hope to see you there! 

