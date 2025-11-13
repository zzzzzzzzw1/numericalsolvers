# Lorenz System Numerical Solvers (MATLAB)

## Overview
Implementation of three numerical ODE solvers, Euler, RK4, and the implicit fourth-order Runge–Kutta method and applies them to the Lorenz system.  
The goal is to compare solver behaviour, stability, and accuracy when modelling chaotic dynamics.

## Solvers Implemented
- **Euler Method** (`EulerSolver.m`)
- **Classical Runge–Kutta 4** (`RK4Solver.m`)
- **Implicit RK4 (Gauss–Legendre)** (`IRK4Solver.m`)
- **Lorenz system definition** (`lorenz.m`)

## How to Run
Open MATLAB and run:

```matlab
main
```
## Repository
```
numericalsolvers/
├── README.md               # Project documentation
└── numericalsolvers/                    # Numerical solver implementations + main script
    ├── main.m              # Entry point: runs all solvers on the Lorenz system
    ├── EulerSolver.m       # Euler integration method
    ├── RK4Solver.m         # Classical Runge–Kutta 4 solver
    ├── IRK4Solver.m        # Implicit RK4 (Gauss–Legendre) solver
    └── lorenz.m            # Lorenz system (dx/dt, dy/dt, dz/dt)
```
