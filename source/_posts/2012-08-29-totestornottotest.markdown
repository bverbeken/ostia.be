---
layout: post
title: "To Test Or Not To Test"
date: 2012-08-29 23:04
comments: true
categories: 
- Play!
- RAD
- agile
- TDD
- games
---

I recently decided to participate in a <a href="http://www.radrace.org/en/index.html">RAD race</a>, which will be held on 9 and 10 November. A RAD race is a competition in which teams (of two people in this case) build a real-life application in two days, using the language and tools of their choice.      
'Rapid Application Development' is an old term whose meaning changed a couple of times over the course of history and even brings back memories of some IBM products \*shivers\*. But the fact that people still organise these events shows that we keep looking for better, cheaper, faster ways of building software. This  particular RAD race is being held for the 15th time, nuff said.    

The Problem
-----------
On the technology side everything is clear. We'll be building the app using <a href="http://www.playframework.org">PlayFramework</a> - only the single best way to build java web apps -, Java, Twitter Bootstrap, JQuery. We'll be using Git for version management, and probably Eclipse on Windows. I'm still in negotiation with my teammate - let's call him Matti - about the latter two. (If you ask him, we're only negotiating about Git and perhaps a client-side mvc framework. In short: no question there ;-)).

But right in the middle of the excitement Matti and I felt when we decided to enter the competition, a question popped up: what about **testing**?     
What should we test? When should we be writing them? Should we be writing any tests at all?

For any real project, the answer would be simple: we'd be writing tests for everything, and we'd be writing them first.
But for the RAD race, things may be different. 

The funny thing about simulation games
--------------------------------------
As a student, I regularily participated in stock exchange simulation games. That is, until I got annoyed enough by the fact that the winner was always the one who put all of his play money in one basket. Sure, for every winner, there were tens of people who used the same strategy and didn't win, but neither did the ones who did build a life-like diversified portfolio.   

The point is that every simulation game rule system has its flaws, and that participants can exploit these flaws in order to win. In most stock exchange simulation games, the flaw is that there's no real money,  so in order to maximize profit, you take as much (fake) risk as you can.    
In a RAD race, the flaw is that your code won't be running in production for years to come. There won't be angry users asking for quick hacks on the phone, and no third or fourth generation junior developer who's made responsible for maintaining the damned thing.

TDD vs Time
-------------------------------
Does this mean that my teammate and I won't be writing time-consuming tests during the RAD race? Hell no!  

First, saying that TDD is time-consuming is like saying your bookkeeper is costing you money. If it is, you're doing it wrong.   
TDD is about producing time, namely time you won't be spending looking for that annoying business blocking bug. Which will probably be during a weekend in your holiday or the one right before your code goes into production.    
And if your code doesn't go into production, the bug will definitely bite you during the demo you're giving to one of the RAD race judges.

Secondly, saying that writing tests is time-consuming implies a direct relationship between Lines Of Code and Time. Or that the productivity of a programmer can be measured in LOC, which is absurd, of course. 

So we won't be writing legacy code (aka code without tests) from the start of the RAD race. We will, however, adapt ourselves to the situation, *in casu* a simulation game situation.    
We'll plan to TDD the business logic, especially if there's complex algorithms involved. And we'll have UI tests that cover at least every page in the app, but probably without checking every possible corner case.       
But I'm still negotiating on that with Matti. 