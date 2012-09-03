---
layout: post
title: "validation testing done right"
date: 2012-09-03 08:56
comments: true
categories: 
- TDD
- testing
- validation
- pattern
published: false
---

I'm a fan of TDD. Developing test first makes it easy to think about what you want your code to do.Also, if done right, TDD results in a whole bunch of tests that act both as documentation and as safety net for refactoring.    
Validation rules should be one of the easiest things to test imho: either a domain object is valid, or it is not. And if it is not, it is not because of a reason. 
<!-- more -->

Yet, I have seen many a programmer struggle with this. Either , or they combine 

In this post I'll describe a simple pattern for validation testing that's easy to understand and that can be used regardless of the framework you're using. I found it especially useful for testing Spring validators.



- write a method that constructs the most basic instance of your model instance that is valid. Call it `valid()`. 
- write a test that verifies that the `valid()` method actually builds a valid object. 
- Write a test for every validation rule, by first building a valid object (call `valid()`), and then change the valid object so that it becomes invalid because of the validation you're testing. 