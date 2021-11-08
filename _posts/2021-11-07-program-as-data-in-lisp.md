---
layout: post
title:  "Program as data in LISP"
date:   2021-11-07 17:28:18 -0800
tags: ["program as data", "LISP", "Julia"]
categories: []
---

I heard about this "program as data" in LISP is so cool recently, and I was wondering how come I never realize it when I learned it, so I want back and took the (Programming Languages B)[https://www.coursera.org/learn/programming-languages-part-b] course again. It is taught in Racket (a dialect of LISP). And Dan only briefly mentioned this "program as data" idea in an optional lecture.

The idea is that LISP can take a program at runtime, modify it, (and then evaluate/run it). Actually, this is not something unique to LISP. Python can take a string at runtime, modify the string, (and then evaluate it). The reason it is especially cool in LISP is that. Data is represented as a list, and a program is also represented as a list (you need a quote if you really want to interpret it as data before evaluation).

I feel this idea sounds very attractive to maybe people how study mathematics or other hard core science, because it has some physiological beauty. To me, maybe some other software engineers as well, it is only something sounds beautiful, but not really usefuly in most cases. As Dan mention, often times when people think they need it, there is actually better way to do it instead of doing eval.
