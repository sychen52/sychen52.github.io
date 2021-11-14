---
layout: post
title:  "Dynamic dispatch for OOP"
date:   2021-11-03 17:28:18 -0800
tags: [object oriented programming, dynamic dispath, functional programming, racket]
categories: []
---

This is a note for [this lecture](https://www.coursera.org/lecture/programming-languages-part-c/optional-dynamic-dispatch-manually-in-racket-FiXQW).

Dynamic dispatch is a unique feature of WHOOP. The main difference between a dynamic dispatched method vs. a closure is that: the `self` in it refers to the current object.

It sounds simple, but when you use dynamic dispatch in OOP, it feels like (especially when `self` is implicit.), although you do not override this method itself, its behavior may change because you override other methods that this method calls. In contrast, when you define a closure, its environment is "frozen" at that moment, the free variables, the other methods.

In this lecture, Dan implemented dynamic dispatch in Racket. And all it needs is to give all methods an additional argument called `self`. Since `self` is an argument, it is not frozen. It is passed in when called. This is exactly "dynamic dispatch".

Details of the racket implementation:

## Class
a struct with a list of variables and a list of functions/methods. Note that every function has an extra argument `self`.

## Constructor
a function that returns an instance of a struct.

## Inheritance
It is done through constructor. It constructs a "base class" struct first, and then add new variables and methods to it.

## Call a method of an object
look up the function in the object's list first, and then call it with the `self` argument being the object itself.

