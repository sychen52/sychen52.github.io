---
layout: post
title:  "Camera Calibration: Zhang's Method"
date:   2019-12-24 17:28:18 -0800
---

{%- include mathjax.html -%}

Credits go to the following video. The rest is my note.
<iframe width="560" height="315" src="https://www.youtube.com/embed/Ou9Uj75DJX0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

DLT has no solution when all the world coords are on the same plane, while Zhang's method is for this case.

Given $M = 4$ or more pairs of world coord $\boldsymbol{X_i}$ and image coord $\boldsymbol{x_i}$, all on plane $Z = 0$, and from $N = 3$ or more viewing positions, figure out intrinsic parameter $\boldsymbol{K}$, Rotation matrix $\boldsymbol{R}$, and projection center $\boldsymbol{X_0}$.

$$
\left[ \begin{array} {c} x \\ y \\ 1 \end{array} \right] =
\boldsymbol{H}
\left[ \begin{array} {c} X \\ Y \\ 1 \end{array} \right] =
\boldsymbol{K}
\left[ \begin{array} {ccc} \boldsymbol{r_1},  \boldsymbol{r_2},  \boldsymbol{t} \end{array} \right]
\left[ \begin{array} {c} X \\ Y \\ 1 \end{array} \right]
$$

where $\boldsymbol{r_3}=\boldsymbol{r_1} \times \boldsymbol{r_2}$ and $\boldsymbol{t}=-\boldsymbol{RX_0}$.

$\boldsymbol{H}$ is a $3 \times 3$ heterogeneous homography matrix with 8 dof. Follow SVD approach in DLT, all elements in $\boldsymbol{H}$ can be figured out from 4 or more pairs of points.

However, after that, we cannot use the QR decomposition trick because $\left[ \begin{array} {ccc} \boldsymbol{r_1},  \boldsymbol{r_2},  \boldsymbol{t} \end{array} \right]$ is not an orthogonal matrix. And this is why we need 3 or more viewing positions to figure out $\boldsymbol{K}$.

$$
\boldsymbol{r_i} = \boldsymbol{K}^{-1}\boldsymbol{h_i} \\
\boldsymbol{r_1}^T\boldsymbol{r_2} = 0 \\
\vert\vert\boldsymbol{r_1}\vert\vert-\vert\vert\boldsymbol{r_2}\vert\vert = 0
$$

If we plug the first equation into the next two, we have only 6 unknowns on the upper diagonal of matrix $\boldsymbol{B=K^{-T}K^{-1}}$. After this, we can do a Cholesky decomposition to get $\boldsymbol{K}$. For each viewing position, we get 6 unknowns in linear 2 linear equations. This is why we need to stack 3 of these and use SVD to solve the unknowns.

{%- include utterance_comments.html -%}