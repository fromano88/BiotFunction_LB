# Biot Function Fits for Thermocapillary Liquid Bridge
The cases considered in this fitting repository are detailed in the paper :

"isothermal_closed_air_large"       -> Case (i)   with $\Gamma_{tc}=10$ and air   as surrounding gas

"adiabatic_closed_air"              -> Case (ii)  with $\Gamma_{tc}=3$  and air   as surrounding gas

"adiabatic_closed_argon"            -> Case (ii)  with $\Gamma_{tc}=3$  and argon as surrounding gas

"adiabatic_closed_air_large"        -> Case (ii)  with $\Gamma_{tc}=10$ and air   as surrounding gas

"adiabatic_open_air/cold_blowing"   -> Case (iii) with $\Gamma_{tc}=3$  and air   as surrounding gas

"adiabatic_open_argon/cold_blowing" -> Case (iii) with $\Gamma_{tc}=3$  and argon as surrounding gas

"adiabatic_open_air/hot_blowing"    -> Case (iv)  with $\Gamma_{tc}=3$  and air   as surrounding gas

"adiabatic_open_argon/hot_blowing"  -> Case (iv)  with $\Gamma_{tc}=3$  and argon as surrounding gas

Each folder contains: 

1) The fitting coefficients $\alpha_{i}^\dagger$ and $\beta_{i}^\dagger$ stored in the two columns of the files "PrXXX_gX_XXX_XX_alpha_beta.dat" are used to compute the fitted location of the Biot function extrema (see [1]). The six lines of these dat files run over the index $i$.

2) The fitting coefficients $\alpha_{i,j}^\ddagger$ and $\beta_{i,j}^\ddagger$ stored in the two columns of the files "A0toA5_XXX_aXFit_PrXXX_gX.dat" are used to compute the power-law fit  of the Biot function in regions H, C1 and C2 (see [1]). The six lines of these dat files run over the index $i$.

3) The files "Biot_ReXXX_PrXXX_GammaXXX_gX.dat" store the Biot function Bi(z) computed by fully-coupled two-phase numerical simulations. The first column stores the coordinate z, while the second one stores the corresponding value of the Biot function.

4) The files "Biot_PrXXX_GammaXXX_gX.dat" are lists of strings to read for importing the numerical simulation data 3).

5) The matlab functions "fit_BiMax.m" and "fit_BiMin.m" use the coefficients stored in 1) to compute the fitted stationary points of the Biot function.

6) The matlab functions "fitBottom.m", "fitCold.m" and "fitTop.m" use the coefficients stored in 2) to compute the power-law fit of the Biot function in regions C1, C2 and H, respectively.

7) The matlab file "TestFits.m" uses all the functions of 5) and 6), as well as the blending formula provided by Romanò et al. (2023) [1] to compute the Biot function fit and plot it in comparison with the reference data, i.e. the numerical simulations stored in 3).

8) The matlab function "BiotAvgLin.m" computes the constant Biot number approximation of the Biot function proposed in [1], see model [SFM-c].

9) The matlab file "TestBiotAvgLin.m" provides an example of how to use 8).

# Reference:
[1] Romanò, F., Stojanovic, M., and Kuhlmann, H. C., "Scaling and modeling of the heat transfer across the free surface of a thermocapillary liquid bridge" (2023)
