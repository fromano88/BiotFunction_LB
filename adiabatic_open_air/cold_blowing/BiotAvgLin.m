function Bi = BiotAvgLin(stringPr,stringG,Re,Gamma)
zBottom          = -0.2;
BiotFuncBottom   = fitBottom(stringPr,stringG,Gamma,Re);                
BiotFuncTop      = fitTop(stringPr,stringG,Gamma,Re);            
[zminBiotFunc,~] = fit_BiMin(stringPr,stringG,Gamma,Re);
zTop             = (0.5+zminBiotFunc)/2;
a                = (BiotFuncTop(zTop) - BiotFuncBottom(zBottom))/(zTop-zBottom);
Bi               = BiotFuncBottom(zBottom) - a*zBottom;
end