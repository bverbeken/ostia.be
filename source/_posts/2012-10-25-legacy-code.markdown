---
layout: post
title: "legacy code"
date: 2012-10-25 08:14
comments: true
categories: 
published: false
---

Until recently, I used the term *legacy code* for old code. Code that had been written ten consultants ago, and has stopped evolving because it's too complicated and critical that nobody dares to take responsibility.   
We've all seen that code and we all love to hate that consultant, don't we. 


And then I learned about a new definition of legacy code: 

{% blockquote %}
legacy code is untested code. 
{% endblockquote %}

I liked the sound of that, but until yesterday I didn't really understand this is indeed a very good definition of legacy code.

<!-- more -->

I'm working on a large scale web application, in a company with multiple teams, each of which is responsible for a single application.  
One of the guys on my team, let's call him Alex, had been working on a restful web service api that would be called by one of those other teams. Couple of days work, the story card moved from TODO over DOING to DONE on our kanban board, story done. 

Fast forward a couple of weeks. A guy from the other team, Bart, comes in and tells me there's something wrong with the webservice: in specific case A, our code wouldn't reply with a *bad request*, but an *ok*. A bug. Nothing big, but a bug nevertheless. I go look in the code, to only find production code. Not a single test there.   
Important note: I'm not blaming Alex. Nobody writes bugfree code. And in Alex's defence, this web service api is (supposed to be) a thin layer on top of the core application, and thin layers should be extremely simple. So I understand why he thought tests are unnecessary. 

Back to the bug. I have a couple of options here.

- I could delegate the bug to Alex. Not my problem anymore. But as a professional software developer, that's not what I do. Also, Alex is part of the team today, but what if the bug bites tomorrow, when Alex is not on the team anymore? 
- I can debug through the code, until I find the bug. Fix it and be done with it. But how do I know I don't introduce a new bug? How do I make sure I fixed the bug? 
- I 

All of the options above are flawed, obviously. But the point is that I have the exact same options in this particular case, as I do when I 
