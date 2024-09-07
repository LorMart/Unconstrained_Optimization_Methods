# Unconstrained_Optimization_Methods
This repository contains the implementation of different iterative optimization algorithms and a testing environment to assess their performances over three functions: the Chained Rosenbrock, the Ascher—Russel Boundary value problem, and the Broyden tridiagonal function Function.
**Methods implemented**:
   Hestenes-Stiefel, restarted Polak–Ribiere and Fletcher–Reeves versions of NLCGM.
   Newton Method
**Benchmarks available**:
  Broyden tridiagonal function
  Troesch problem
  Chained Rosenbrock Function
  
The script "Generate [problem's name] Gradient.m" uses the syms package to compute the generic form of the Gradient's entry and saves it as a Matlab function. This function is used iteratively from the script "Eval problem's name Gradient.m" to compute the whole Gradient. The Hessians also have a similar regularity; all three are band matrices, and for each of their diagonals, it is possible to find a general expression in which only the indexes of the variables used to compute the entry change over the diagonal. This approach computes symbolically very few derivatives (max 10 per problem) only once to find the generic functions, allowing for efficient computation of the Gradient and Hessian. Depending on the problem's definition, ad-hoc expressions are derived and used for the boundary entries of the Gradients and Hessians.
