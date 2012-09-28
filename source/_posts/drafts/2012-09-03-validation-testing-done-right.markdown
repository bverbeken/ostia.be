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

I like TDD. Developing test first makes it easy to think about what you want your code to do. Also, if done right, TDD results in a whole bunch of tests that act both as documentation and as safety net for refactoring.    
Validation rules are amongst the easiest things to test, imho: either a domain object is valid or it is invalid for a reason.

In this post I'll describe a simple pattern for validation testing that's easy to understand and that can be used regardless of the framework you're using.  

<!-- more -->

The Pattern
------------
We'll need one test for every reason for which a model object can be invalid, plus one test for every possible valid state (for most domain objects this will be 1 test).

- write a method that constructs the most basic instance of your model instance that is valid. Call it `valid()`. 
- write a test that verifies that the `valid()` method actually builds a valid object. 
- Write a test for every validation rule, by first building a valid object (call `valid()`), and then change the valid object so that violates the validation rule you're testing. 

An example 
----------------

First, let's start by defining a domain model class which we'll be validating.

``` java Car.java
	public class Car {

		@Required		
		private Vendor vendor;	
		private Set<Wheel> wheels; 
		private Color color; 

		/* getters and setters */

	}
```

Please note that 

``` java CarValidationTest.java 
	public class CarValidationTest {

		@Test
		public void aValidCarIsValid(){
			Car validCar = valid();
			assertThat();
		}

		private Errors validate(Car car){
			Errors errors = new BindException("car", car); 
			validator.validate(car, errors); 
			return errors; 
		}

	}
```

Even Better: Custom Matchers
----------------------------


Even Betterer: Builder Pattern
-----------------------------------
If you're using the Builder Pattern (XXX Link?) for building your domain objects, you can move your `valid()` method there, and have 

Suppose we have a CarBuilder: 

``` java CarBuilder.java
	public class CarBuilder {

		public Car build(){
			Car car = new Car();
			car.setVendor(vendor);
			car.setWheels(wheels);
			car.setColor(color);
		}

		public static CarBuilder aValidCar(){
			return new CarBuilder()
				.withVendor(new Vendor());
		}

	}
```

The result is a very readable validation test: 

``` java CarValidatorTest.java

	...
	@Test
	public void aCarShouldHaveAVendor(){
		Car car = aValidCar().withoutVendor().build();		
		assertThat(validate(car)).hasFieldError("vendor", "required"); 
	}
	...

```