#Euler-Bernoulli Beam Theory - Numerical Analysis Project

## Overview

This project implements a numerical solution to the **Euler-Bernoulli beam deflection problem** using finite difference methods and pentadiagonal Gaussian elimination. The analysis compares beam deflection across different cross sectional geometries (annulus and rectangular) and boundary conditions (fixed-free and fixed-pinned).

## Project Description

The Euler Bernoulli beam theory models the vertical deflection of beams under load, historically used in landmark structures like the Eiffel Tower and Ferris wheel. This implementation solves the fourth order differential equation:

```
EIy⁽⁴⁾(x) = f(x),  0 ≤ x ≤ L
```

where:
- `y(x)` is the vertical deflection at position x
- `E` is Young's modulus (69 GPa for aluminum)
- `I` is the second moment of inertia
- `f` is the applied force per unit length (gravity: f = Sρg)

## Documentation

📄 **[Full Project Report (PDF)](euler-bernoulli_beam_theory-analysis_.pdf)**

The complete analysis, methodology, results, and mathematical derivations are available in the PDF report generated from `main.tex`.