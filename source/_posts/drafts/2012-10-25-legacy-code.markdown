---
layout: post
title: "Legacy code, an epyphany"
date: 2012-10-25 08:14
comments: true
categories: 
- legacy code 
- TDD
- testing
published: false
---

Until recently, I used the term *legacy code* for bad, ancient code that had been written ten consultants ago, for code that has stopped evolving because it's too complicated and critical that nobody dares to take responsibility, for code that came from someone else, you get the idea. We've all seen that code and we all love to hate that consultant, don't we. 

And then I learned about another definition of legacy code, one that Michael Feathers ([@mfeathers](https://twitter.com/mfeathers)) introduced in his book, [Working Effectively with Legacy Code](http://www.informit.com/store/working-effectively-with-legacy-code-9780131177055): 


{% blockquote %}
legacy code is code without tests. 
{% endblockquote %}


Nice, short and catchy, but until yesterday I didn't really understand this is indeed a very good definition of legacy code.

<!-- more -->

I'm working on a large scale web application, in a company with multiple teams, each of which is responsible for a single application.  
One of the guys on my team, let's call him Alex, had been working on a restful web service api that would be called by one of those other teams. Couple of days work, the story card moved from TODO over DOING to DONE on our kanban board, story done. 

Fast forward a couple of weeks. A guy from the other team, Bart, comes in and tells me there's something wrong with the webservice: in a specific case, our code wouldn't reply with a *bad request*, but an *ok*. A bug. No biggie, but a bug nevertheless. I go look in the code, to only find production code. Not a single test there.   

*(Before going on, an important note: I'm not blaming Alex. Nobody writes bugfree code. In Alex's defence, this web service api is a thin layer on top of the core application, and thin layers should be trivial. So I understand why writing tests in this case seem like a waste of time.)* 

Back to the bug. I have a couple of options here.

- I could **delegate** the bug to Alex, so that it's not my problem anymore. However, Alex is part of the team today, but what if another bug bites when he's not anymore? 
- I could debug through the code, until I find the bug. **Just fix it** and be done with it. But how do I know I don't introduce a new bug? How do I make sure I fixed the bug? 
- Better, I could **write a single test** that reproduces this bug, and then fix it. However,  we'd still rely on the other team's testing to know whether our api is any good. Furthermore, it could be hard to write a single failing test; perhaps the code as it is now is not very testable, given that it had been written without tests in the first place. 
- I could treat our web service api like a nuclear reactor: build a concrete shield **wall of solid integration tests** around it, without touching the code. Then refactor, and then write the test that reproduces the bug. But that would be very time-consuming. 

All of these options above are flawed to some degree. Either they involve unprofessional behaviour, or I need to spend more time then I would like to solve the bug.    

The point is that I have the exact same options of responding to this particular bug as I do for a bug in bad code that's been there for years. It doesn't matter when the code was written or whether the guy who wrote it is still on the team or not, untested code is a black box.    
And if the cure is the same, it must be the same disease, the rest is politics and religion.   

Hence: legacy code is untested code and untested code is legacy code.    
QED ;)


