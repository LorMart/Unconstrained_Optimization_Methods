# Unconstrained Optimization Methods

This repository contains the implementation of various iterative optimization algorithms and a testing environment to assess their performance across three specific functions:

- **Chained Rosenbrock Function**
- **Ascher–Russel Boundary Value Problem**
- **Broyden Tridiagonal Function**

## **Methods Implemented**
The following optimization methods are implemented:

- **Nonlinear Conjugate Gradient Methods (NLCGM):**
  - Hestenes-Stiefel (HS)
  - Restarted Polak–Ribiere (PR)
  - Fletcher–Reeves (FR)
  
- **Newton's Method**

## **Benchmarks Available**
The performance of the implemented algorithms is evaluated on the following benchmark problems:

- **Broyden Tridiagonal Function**
- **Troesch Problem**
- **Chained Rosenbrock Function**

## **Gradient and Hessian Computation**
The repository includes scripts for symbolic computation of gradients and Hessians to streamline the optimization process. These scripts utilize the `syms` package in MATLAB for symbolic computation:

- **Gradient Computation:**
  - The script `"Generate [problem's name] Gradient.m"` computes the generic form of the Gradient's entries and saves it as a MATLAB function. 
  - This function is then used iteratively in `"Eval problem's name Gradient.m"` to compute the entire Gradient efficiently.

- **Hessian Computation:**
  - The Hessians are computed similarly. Since all three benchmark problems have band matrices, only a few symbolic derivatives are required (maximum of 10 per problem) to derive general expressions for each diagonal of the Hessian matrix.
  - Specific expressions are derived and applied to the boundary entries of the Gradient and Hessian based on the problem’s definition.

By using symbolic computation only for a few entries and deriving generic functions for repeated use, the repository allows for efficient computation of both the Gradient and Hessian, speeding up the optimization process.

---

This repository provides a flexible and efficient environment for testing iterative optimization algorithms on challenging benchmark problems, with a strong focus on symbolic computation to enhance performance.
