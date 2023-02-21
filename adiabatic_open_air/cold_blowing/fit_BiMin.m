function [zminBiotFunc, BiminBiotFunc] = fit_BiMin(stringPr, stringG, Gamma, Re)

alphaBeta = load([stringPr '_' stringG '_min_delta_alpha_beta.dat']);

A0 = alphaBeta(1,1) + alphaBeta(1,2)*Gamma;
A1 = alphaBeta(2,1) + alphaBeta(2,2)*Gamma;
A2 = alphaBeta(3,1) + alphaBeta(3,2)*Gamma;
A3 = alphaBeta(4,1) + alphaBeta(4,2)*Gamma;
A4 = alphaBeta(5,1) + alphaBeta(5,2)*Gamma;
A5 = alphaBeta(6,1) + alphaBeta(6,2)*Gamma;

deltaMin = A0 + A1*Re + A2/Re^A3 + A4*(1-exp(Re*A5));
zminBiotFunc = 0.5 - deltaMin;


alphaBeta  = load([stringPr '_' stringG '_min_Bi_alpha_beta.dat']);

A0 = alphaBeta(1,1) + alphaBeta(1,2)*Gamma;
A1 = alphaBeta(2,1) + alphaBeta(2,2)*Gamma;
A2 = alphaBeta(3,1) + alphaBeta(3,2)*Gamma;
A3 = alphaBeta(4,1) + alphaBeta(4,2)*Gamma;
A4 = alphaBeta(5,1) + alphaBeta(5,2)*Gamma;
A5 = alphaBeta(6,1) + alphaBeta(6,2)*Gamma;

BiminBiotFunc = A0 + A1*Re + A2/Re^A3 + A4*(1-exp(Re*A5));