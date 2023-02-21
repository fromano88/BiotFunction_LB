clear all; close all; clc
% Select the Prandl number: either "Pr28.84" or "Pr69.18"
stringPr = char("Pr69.18"); 
% Select the gravitational conditions: either "g0" or "g1"
stringG  = char("g0");
% Select the Reynolds number
Re       = 100;
% Select the aspect ratio
Gamma    = 0.5;
% Compute the average Biot number
Bi       = BiotAvgLin(stringPr,stringG,Re,Gamma);
fprintf('The average Biot number approximation is Bi_c = %d\n\n',Bi)