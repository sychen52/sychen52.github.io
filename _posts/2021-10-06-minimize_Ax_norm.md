---
layout: post
title:  "minimize |Ax| s.t. |x| = 1"
date:   2021-10-06 07:28:18 -0800
tags: [optimization]
categories: []
---
{%- include mathjax.html -%}

# Solution:
- Do a svd on A
- x = the v vector corresponding to the smallest singular value.

# SVD:
One way to understand SVD is as follows:

![svd](https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Singular_value_decomposition_visualisation.svg/800px-Singular_value_decomposition_visualisation.svg.png)

Another way is:

$$A=\sum_{i=1}^r\lambda_iu_iv_i^T$$, where $$\lambda_i$$ is the singular value; $$u_i, v_i$$ are the column vectors of $$U, V$$. These column vector are orthogonal to each other, meaning $$u_i^Tu_j=\left\{\begin{matrix}0,\text{ if }i\neq j \\1,\text{ if }i=j \end{matrix}\right.$$ and $$v_i^Tv_j=\left\{\begin{matrix}0,\text{ if }i\neq j \\1,\text{ if }i=j \end{matrix}\right.$$

For real matrix, all singular values are non-negative.

# Proof
- First, we assume m > n and n = r, otherwise, the result would be 0.
- decompose x into v-space, $$x=\sum_{i=1}^n x=x_iv_i$$.
- $$Ax=\sum_{i=1}^n \lambda_iu_iv_i^T\sum_{j=1}^n x_jv_j=\sum_{i=1}^n \lambda_ix_iu_i$$.
- $$|Ax|=\sqrt{\sum_{i=1}^r \lambda_i^2x_i^2}\text{ where }\sum_{i=1}^n x_i^2 = 1$$. This is true because ui and vi are orthogonal.
- Now you can see $$|Ax|=\lambda_n,\text{ if }x_i=\left\{\begin{matrix}0,\text{ if }i\neq n\\ 1,\text{ if }i=n\end{matrix}\right.$$. Here I assume singular values are sorted from large to small.


