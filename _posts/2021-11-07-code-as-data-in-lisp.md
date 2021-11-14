---
layout: post
title:  "Code as data in LISP"
date:   2021-11-07 17:28:18 -0800
tags: ["code as data", "LISP", "Julia", "Python"]
categories: []
---

I heard about this "code as data" in LISP is so cool recently, and I was wondering how come I never realize it when I learned it, so I want back and took the [Programming Languages B](https://www.coursera.org/learn/programming-languages-part-b) course again. It is taught in Racket (a dialect of LISP). And Dan only briefly mentioned this "code as data" idea in an optional lecture.

The idea is that LISP can take a program at runtime, modify it, (and then evaluate/run it). Actually, this is not something unique to LISP. A lot of "LISP inspired languages", such as Python, can take a string at runtime, modify the string, and then evaluate it. (Python also have ast.parse to parse the string into AST to make it easier to modify.) The reason it is especially cool in LISP is that: Data is represented as a list, and a program is also represented as a list (you need a quote if you really want to interpret it as data before evaluation).

[Another advantage of this same representation of data and code in LISP](https://stackoverflow.com/questions/31733766/in-what-sense-are-languages-like-elixir-and-julia-homoiconic) is that: when you write macro's, what you write is what will be generated. Unlike in Julia, for example, you'd better check the generated code is what you want.

I found [this video](https://www.youtube.com/watch?v=CVKIpfDqs3I&t=622s) showcasing this feature in Python, Scheme, and Julia.

I feel this idea sounds very attractive to maybe people how study mathematics or other hard core science, because it has some physiological beauty. To me, maybe some other software engineers as well, it is only something sounds beautiful, but not really usefuly in most cases. As Dan mention, often times when people think they need it, there is actually better way to do it instead of doing eval.
