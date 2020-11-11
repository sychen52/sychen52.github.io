---
layout: post
title:  "Is Julia Ready for Deep Learning"
date:   2020-11-10 17:28:18 -0800
---

I heard about Swift and Julia for deep learning during fast.ai's course [https://www.youtube.com/watch?v=3TqN_M1L4ts]. Then I spent quite some time to try figuring out whether any of these languages is a better choice for deep learning than Python. However, soon I realized that Chris Lattner left Google and Swift for Tensorflow project is slowing down and even Jeremy Howard is less passionate about it [https://twimlai.com/whats-next-for-fast-ai-w-jeremy-howard/]. Then the only choice left for now is Julia AFAIK. The Question is whether Julia is ready for deep learning.

# Memory Management
I noticed this issue when Chris Lattner pointed during a debate [https://twimlai.com/the-great-ml-language-un-debate/]. In short, Julia uses Garbage Collector. It may cause memory not being released in time. This is especially problematic for GPU since its memory is much smaller than CPU memory. The good news is there is some work around [https://juliagpu.gitlab.io/CUDA.jl/usage/memory/], but it would be better if Julia has some deterministic memory management. There is a ongoing discussion about this [https://discourse.julialang.org/t/proposal-for-deterministic-memory-management/39305].

# Speed
I guess most people come to Julia for speed. However, in order to get the optimal speed, it is not that straight forward. One problem is avoid allocation [https://www.youtube.com/watch?v=o8qTJGcPWkE]. Another problem is type inference. Julia is a dynamic typing language; however, in order to get the best speed, you are encouraged to have type annotation and type stability. The purpose of this is to make it easy for people who does not care about speed that much. However, personally, static type can make thing much more straight forward.

# Community
Julia has a large scientific computing community. For deep learning, there is also a community working on the ecosystem [https://github.com/FluxML/ML-Coordination-Tracker]. 

# Solve Two Language Problem
I think this is a pretty unique point about Julia. People are proud of using Julia from high level all the way to low level problem. The fact that Julia can be used to do CUDA programming just blew my mind [https://www.youtube.com/watch?v=525t9-nsn5Y]. 

{%- include utterance_comments.html -%}