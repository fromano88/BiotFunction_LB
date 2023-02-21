function BiotFunc = fitBottom(stringPr,stringG,Gamma,Re)
GammaA = load(strcat('A0toA5_Bottom_a0Fit_',stringPr,'_',stringG,'.dat'));
GammaB = load(strcat('A0toA5_Bottom_a1Fit_',stringPr,'_',stringG,'.dat'));
GammaC = load(strcat('A0toA5_Bottom_a2Fit_',stringPr,'_',stringG,'.dat'));
a0_1  = GammaA(1,1) + Gamma*GammaA(1,2);
a0_2  = GammaA(2,1) + Gamma*GammaA(2,2);
a0_3  = GammaA(3,1) + Gamma*GammaA(3,2);
a0_4  = GammaA(4,1) + Gamma*GammaA(4,2);
a0_5  = GammaA(5,1) + Gamma*GammaA(5,2);
a0_6  = GammaA(6,1) + Gamma*GammaA(6,2);
a0fitted = a0_1 + a0_2.*Re + a0_3*Re.^a0_4 + a0_5*(1-exp(Re.*a0_6));
a1_1  = GammaB(1,1) + Gamma*GammaB(1,2);
a1_2  = GammaB(2,1) + Gamma*GammaB(2,2);
a1_3  = GammaB(3,1) + Gamma*GammaB(3,2);
a1_4  = GammaB(4,1) + Gamma*GammaB(4,2);
a1_5  = GammaB(5,1) + Gamma*GammaB(5,2);
a1_6  = GammaB(6,1) + Gamma*GammaB(6,2);
a1fitted = a1_1 + a1_2.*Re + a1_3*Re.^a1_4 + a1_5*(1-exp(Re.*a1_6));
a2_1  = GammaC(1,1) + Gamma*GammaC(1,2);
a2_2  = GammaC(2,1) + Gamma*GammaC(2,2);
a2_3  = GammaC(3,1) + Gamma*GammaC(3,2);
a2_4  = GammaC(4,1) + Gamma*GammaC(4,2);
a2_5  = GammaC(5,1) + Gamma*GammaC(5,2);
a2_6  = GammaC(6,1) + Gamma*GammaC(6,2);
a2fitted = a2_1 + a2_2.*Re + a2_3*Re.^a2_4 + a2_5*(1-exp(Re.*a2_6));
BiotFunc = @(z) a0fitted + a1fitted.*abs(z+0.5).^a2fitted; 
end
