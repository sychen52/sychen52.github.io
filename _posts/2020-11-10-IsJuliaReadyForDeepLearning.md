---
layout: post
title:  "Is Julia Ready for Deep Learning"
date:   2020-11-10 17:28:18 -0800
tags: [Julialang, Julia, deep learning, DL]
categories: []
---

I heard about Swift and Julia for deep learning during [fast.ai's course](https://www.youtube.com/watch?v=3TqN_M1L4ts). Then I spent quite some time to try figuring out whether any of these languages is a better choice for deep learning than Python. However, soon I realized that Chris Lattner left Google and Swift for Tensorflow project is slowing down and even [Jeremy Howard is less passionate about it](https://twimlai.com/whats-next-for-fast-ai-w-jeremy-howard/). Then the only choice left for now is Julia AFAIK. The Question is whether Julia is ready for deep learning.

# Memory Management
I noticed this issue when Chris Lattner pointed during a [debate](https://twimlai.com/the-great-ml-language-un-debate/). In short, Julia uses the Garbage Collector. It may cause memory not being released in time. This is especially problematic for GPU since its memory is much smaller than CPU memory. The good news is there is some [workaround](https://juliagpu.gitlab.io/CUDA.jl/usage/memory/), but it would be better if Julia has some deterministic memory management. There is an [ongoing discussion about this](https://discourse.julialang.org/t/proposal-for-deterministic-memory-management/39305).

# Speed
I guess most people come to Julia for speed. However, to get the optimal speed, it is not that straight forward. One problem is to [avoid allocation](https://www.youtube.com/watch?v=o8qTJGcPWkE). Another problem is type inference. Julia is a dynamic typing language; however, to get the best speed, you are encouraged to have type annotation and type stability. The purpose of this is to make it easy for people who do not care about the speed that much. However, I think static typing can make things much more straightforward. This leads to the next point I would like to mention

# Ahead of Time (AOT) Compilation vs. Just In Time (JIT) Compilation vs. Interpreter
As a rule of thumb, static typing language can be AOT compiled while dynamic language usually runs on an interpreter, and sometimes with a JIT compiler. Because you need to know the type to deeply optimize the code, static typing languages can directly be optimized AOT, while dynamic typing languages cannot only to optimized at runtime when the type is known with a JIT. Julia is none of this. It is [just ahead of time (JAOT)](https://www.youtube.com/watch?v=XWIZ_dCO6X8) compiled. The pro is that you have a deeply optimized dynamic typing language. The con is this JAOT takes a long time, and this is the well known time to first plot issue. This issue is not a big deal if you use Julia for deep learning. However, dynamic typing is something built in the design of the language, while you enjoy the ease of use, you also have to bear with the awkwardness it brings: 1) long JAOT compilation time; 2) hard to build into libraries and executables. Luckily, both of these two are somewhat solved by [PackageCompiler.jl](https://github.com/JuliaLang/PackageCompiler.jl), but awkwardly IMO.

# Community
Julia has a large scientific computing community. For deep learning, there is also a community working on the [machine learning ecosystem](https://github.com/FluxML/ML-Coordination-Tracker). 

# Solve Two Language Problem
I think this is a pretty unique point about Julia. People are proud of using Julia from high-level all the way to low-level programming. The fact that Julia can be used to do [CUDA programming](https://www.youtube.com/watch?v=525t9-nsn5Y) just blew my mind. Keep in mind that when you get into the advanced metaprogramming in Julia, it feels quite different compared to the part of Julia you normally use but it is technically still Julia language.

# Deep Learning Library and Auto Differentiation (AD)
I guess a lot of people care about this the most. The reason I put it at the very end is that it is not very mature yet. The most promising deep learning library is called [Flux.jl](https://github.com/FluxML/Flux.jl) and the AD it uses is called [Zygote.jl](https://github.com/FluxML/Zygote.jl). They are still undergoing some changes. As far as I know, there may be a [new AD](https://youtu.be/mQnSRfseu0c) coming out to replace Zygote. Unlike Pytorch, where AD only works on Pytorch's Tensor class, Zygote is a source to source AD that does not need to introduce another Tensor class, it just works on the existing data structure. This can be a huge advantage for developers. In Pytorch ecosystem, to be differentiable, developers need to re-write their libraries using Pytorch's Tensor. For example, [Kornia](https://github.com/kornia/kornia) is a re-write of OpenCV using Pytorch. This will not happen to Julia package developer since the AD will just work.

To summary up, IMHO, this is a very good time for early adopters and people who want to make contributions. However, if you just want to get things done, or you want the current best (fast and fully functional) solution, Julia is not ready yet.

{%- include utterance_comments.html -%}