---
layout: post
title:  "Camera Calibration: Direct Linear Transform"
date:   2019-12-24 07:28:18 -0800
categories: []
---

{%- include mathjax.html -%}

Credits go to the following video. The rest is my note.
<iframe width="560" height="315" src="https://www.youtube.com/embed/ywternCEqSU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Direct Linear transform (DLT) maps world coords to image coords

$$
\begin{array}{c}\boldsymbol{x} \\ 3 \times 1 \end{array} = 
\begin{array}{c}\boldsymbol{K} \\ 3 \times 3 \end{array}
\begin{array}{c}\boldsymbol{R} \\ 3 \times 3 \end{array}
\left[ 
    \begin{array}{c}\boldsymbol{I} \\ 3 \times 3 \end{array} \vert 
    \begin{array}{c}-\boldsymbol{X_0} \\ 3 \times 1 \end{array} 
\right]
\begin{array}{c}\boldsymbol{X} \\ 4 \times 1 \end{array} = 
\begin{array}{c}\boldsymbol{P} \\ 3 \times 4 \end{array}
\begin{array}{c}\boldsymbol{X} \\ 4 \times 1 \end{array} \\
$$

Given $$M = 6$$ or more pairs of world coord $$\boldsymbol{X_i}$$ and image coord $$\boldsymbol{x_i}$$, figure out intrinsic parameter $$\boldsymbol{K}$$, Rotation matrix $$\boldsymbol{R}$$, and projection center $$\boldsymbol{X_0}$$. For each pair, $$\boldsymbol{x_i} = \boldsymbol{PX_i} = \left[ \begin{array}{c}\boldsymbol{A^T} \\ \boldsymbol{B^T} \\ \boldsymbol{C^T} \end{array} \right] \boldsymbol{X_i}$$ can be rewritten as:

$$
\left[ \begin{array}{ccc}
    -\boldsymbol{X}_i^T, \boldsymbol{0}^T, x_i\boldsymbol{X}_i^T \\
    \boldsymbol{0}^T, -\boldsymbol{X}_i^T, y_i\boldsymbol{X}_i^T \\
\end{array} \right]
\left[ \begin{array}{c}
\boldsymbol{A} \\ \boldsymbol{B} \\ \boldsymbol{C}
\end{array} \right]
= \boldsymbol{0}
$$

We can stack $$M$$ of such equation together and get

$$
\begin{array}{c}\boldsymbol{M} \\ 2M \times 12 \end{array}
\begin{array}{c}\boldsymbol{p} \\ 12 \times 1 \end{array} = 
\begin{array}{c}\boldsymbol{0} \\ 2M \times 1 \end{array}
$$

Now the problem becomes:

Given $$\boldsymbol{M}$$, find $$\boldsymbol{\hat{p}} = argmax_\boldsymbol{p} \boldsymbol{p^TM^TMp}$$, such that $$\vert \boldsymbol{p}\vert = 1$$.

The solution to this is do a SVD of $$\boldsymbol{M}$$, and set $$\boldsymbol{p} = \boldsymbol{v_{12}}$$. $$\boldsymbol{v_{12}}$$ is the eigenvector corresponds to the smallest singular value $$s_{12}$$ (all singular values are non-negative). Try proof this yourself. Hint: decompose $$\boldsymbol{p}$$ into the space defined by $$\boldsymbol{v_i}$$.

There are two corner cases that there is no solution: 1. All world coords are on the same plane. 2. all world coords and the projection center are locate on a twisted cubic curve.

After this, we get matrix $$\boldsymbol{\hat{P}}$$.

$$
\boldsymbol{\hat{P}} =
\left[ 
    \boldsymbol{\hat{H}} \vert 
    \boldsymbol{\hat{h}} 
\right] =
\left[ 
    \boldsymbol{\hat{K}\hat{R}} \vert 
    -\boldsymbol{\hat{K}\hat{R}\hat{X_0}} 
\right]
$$

Therefore, $$\boldsymbol{\hat{X_0}} = - \boldsymbol{\hat{H}}^{-1} \boldsymbol{\hat{h}}$$. QR decomposition gives a orthogonal matrix times a upper diagonal matrix, while what we need is a upper diagonal matrix times a orthogonal matrix. In order to achieve that, we QT decompose $$\boldsymbol{\hat{H}}^{-1}$$ to get $$\boldsymbol{\hat{R}}^{-1}=\boldsymbol{\hat{R}}^T$$ and $$\boldsymbol{\hat{K}}^{-1}$$

Some final touchups: times $$\boldsymbol{\hat{K}}$$ with $$1/\hat{K_{33}}$$ to make $$\hat{K_{33}} = 1$$. $$\hat{K_{11}}$$ and $$\hat{K_{22}}$$ need to be positive, so throw the sign to rotation matrix $$\boldsymbol{\hat{R}}$$.

{%- include utterance_comments.html -%}
