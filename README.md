# Unconstrained Optimization Methods

This repository contains the implementation of various iterative optimization algorithms and a testing environment to assess their performance across three specific functions.

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
- ![First Formula](https://latex.codecogs.com/png.latex?F(x)%20=%20%5Cfrac{1}{2}%20%5Csum_%7Bk=1%7D%5E%7Bm%7D%20f_k%5E2(x)%2C%20%5Cquad%20f_k(x)%20=%20(3%20-%202x_k)x_k%20-%20x_%7Bk-1%7D%20-%202x_%7Bk+1%7D%20+%201)
- **Troesch Problem**
- ![Troesch Problem](https://latex.codecogs.com/png.latex?F(x)%20=%20%5Cfrac{1}{2}%20%5Csum_%7Bk=1%7D%5E%7Bn%7D%20f_k%5E2(x)%2C)
![fk1](https://latex.codecogs.com/png.latex?f_k(x)%20=%20%5Cbegin%7Bcases%7D%202x_k%20+%20%5Crho%20h%5E2%20%5Csinh(%5Crho%20x_k)%20-%20x_%7Bk+1%7D%2C%20&space;k%20=%201%2C%20%5C%5C%202x_k%20+%20%5Crho%20h%5E2%20%5Csinh(%5Crho%20x_k)%20-%20x_%7Bk-1%7D%20-%20x_%7Bk+1%7D%2C%20&space;1%20%3C%20k%20%3C%20n%2C%20%5C%5C%202x_k%20+%20%5Crho%20h%5E2%20%5Csinh(%5Crho%20x_k)%20-%20x_%7Bk-1%7D%20-%201%2C%20&space;k%20=%20n%2C%20%5Cend%7Bcases%7D)
![Constants](https://latex.codecogs.com/png.latex?%5Crho%20=%2010%2C%20%5Cquad%20h%20=%20%5Cfrac{1}{n+1})

- **Chained Rosenbrock Function** 
- ![Equation](https://latex.codecogs.com/png.latex?\sum_{i=2}^{n}\left[100\left(x_{i-1}^2-x_i\right)^2+\left(x_{i-1}-1\right)^2\right])

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

# Unconstrained Optimization Methods

This repository contains the implementation of various iterative optimization algorithms and a testing environment to assess their performance across three specific functions.

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
- ![First Formula](https://latex.codecogs.com/png.latex?F(x)%20=%20%5Cfrac{1}{2}%20%5Csum_%7Bk=1%7D%5E%7Bm%7D%20f_k%5E2(x)%2C%20%5Cquad%20f_k(x)%20=%20(3%20-%202x_k)x_k%20-%20x_%7Bk-1%7D%20-%202x_%7Bk+1%7D%20+%201)
- **Troesch Problem**
- ![Troesch Problem](https://latex.codecogs.com/png.latex?F(x)%20=%20%5Cfrac{1}{2}%20%5Csum_%7Bk=1%7D%5E%7Bn%7D%20f_k%5E2(x)%2C)
![fk1](https://latex.codecogs.com/png.latex?f_k(x)%20=%20%5Cbegin%7Bcases%7D%202x_k%20+%20%5Crho%20h%5E2%20%5Csinh(%5Crho%20x_k)%20-%20x_%7Bk+1%7D%2C%20&space;k%20=%201%2C%20%5C%5C%202x_k%20+%20%5Crho%20h%5E2%20%5Csinh(%5Crho%20x_k)%20-%20x_%7Bk-1%7D%20-%20x_%7Bk+1%7D%2C%20&space;1%20%3C%20k%20%3C%20n%2C%20%5C%5C%202x_k%20+%20%5Crho%20h%5E2%20%5Csinh(%5Crho%20x_k)%20-%20x_%7Bk-1%7D%20-%201%2C%20&space;k%20=%20n%2C%20%5Cend%7Bcases%7D)
![Constants](https://latex.codecogs.com/png.latex?%5Crho%20=%2010%2C%20%5Cquad%20h%20=%20%5Cfrac{1}{n+1})

- **Chained Rosenbrock Function** 
- ![Equation](https://latex.codecogs.com/png.latex?\sum_{i=2}^{n}\left[100\left(x_{i-1}^2-x_i\right)^2+\left(x_{i-1}-1\right)^2\right])

## **Gradient and Hessian Computation**
The repository includes scripts for symbolic computation of gradients and Hessians to streamline the optimization process. These scripts utilize the `syms` package in MATLAB for symbolic computation:

- **Gradient Computation:**
  - The script `"Generate [problem's name] Gradient.m"` computes the generic form of the Gradient's entries and saves it as a MATLAB function. 
  - This function is then used iteratively in `"Eval problem's name Gradient.m"` to compute the entire Gradient efficiently.

- **Hessian Computation:**
  - The Hessians are computed similarly. Since all three benchmark problems have band matrices, only a few symbolic derivatives are required (maximum of 10 per problem) to derive general expressions for each diagonal of the Hessian matrix.
  - Specific expressions are derived and applied to the boundary entries of the Gradient and Hessian based on the problem’s definition.

By using symbolic computation only for a few entries and deriving generic functions for repeated use, the repository allows for efficient computation of both the Gradient and Hessian, speeding up the optimization process.

## **Performance Indicators**

The performance of the algorithms will be evaluated based on three main categories: Efficiency, Reliability, and Quality of the Solution.

### Efficiency

Efficiency quantifies the computational effort required to obtain a solution from the algorithm. It is expressed in terms of both memory usage and computational time/iterations. Specifically:

- **Computational Time**: The total time taken by the algorithm to reach a solution. This measure provides a tangible sense of performance but is dependent on the hardware used.
- **Iterations to Convergence**: The number of iterations required for the algorithm to converge to a solution. This measure is more abstract and reflects the algorithm’s behavior regardless of the hardware, offering a more generalizable assessment.

### Reliability

Reliability assesses the algorithm's capacity to perform consistently well across various situations. This is evaluated using the **Success Rate**, which measures how frequently the algorithm successfully solves the problem across different test scenarios.

### Quality of the Solution

The quality of the solution is evaluated through different metrics depending on whether a known minimum point exists:

- **Fixed-Target Method**: If a minimum point of the problem is known, the fixed-target method is employed to assess solution quality.
- **Fixed-Cost Approach**: If no known minimum exists, the quality of the solution is evaluated using the norm of the gradient and the value of \( f(x^*) \) as metrics.

### Starting Points

For a fair comparison, both algorithms will be tested using the same set of starting points for each problem. The starting points are generated using the script `Generate problem’s name Random start pts.m`, which evaluates multiple Gaussian distributions with a fixed mean \( \mu \) and standard deviation \( \sigma \). 

- **Mean (\(\mu\))**: Initially, \( \mu_0 \) will be a significant point, such as a known minimum, or suggested starting points from the literature if no minimum is known.
- **Standard Deviation (\(\sigma\))**: Generally, small values will be used to keep points close to the mean. However, larger values of \( \sigma \) may also be tested to increase the dispersion of initial points and present more challenging problems for the algorithms.



