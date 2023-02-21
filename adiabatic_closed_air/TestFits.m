clear all; close all; clc
% =========================================================================
%  Uncomment the string 'name' of the corresponding Biot function to test
% =========================================================================
%%
% =========================================================================
%                                   case 1
%                               Pr = 28.84, g0
% =========================================================================
name   = 'Biot_Pr28.84_Gamma0.50_g0.dat';
% name   = 'Biot_Pr28.84_Gamma0.66_g0.dat';
% name   = 'Biot_Pr28.84_Gamma1.00_g0.dat';
% =========================================================================
%                                   case 2
%                               Pr = 28.84, g1
% =========================================================================
% name   = 'Biot_Pr28.84_Gamma0.50_g1.dat';
% name   = 'Biot_Pr28.84_Gamma0.66_g1.dat';
% name   = 'Biot_Pr28.84_Gamma1.00_g1.dat';
% =========================================================================
%                                   case 3
%                               Pr = 69.18, g0
% =========================================================================
% name   = 'Biot_Pr69.18_Gamma0.50_g0.dat';
% name   = 'Biot_Pr69.18_Gamma0.66_g0.dat';
% name   = 'Biot_Pr69.18_Gamma1.00_g0.dat';
% =========================================================================
%                                   case 4
%                               Pr = 69.18, g1
% =========================================================================
% name   = 'Biot_Pr69.18_Gamma0.50_g1.dat';
% name   = 'Biot_Pr69.18_Gamma0.66_g1.dat';
% name   = 'Biot_Pr69.18_Gamma1.00_g1.dat';
%% Name 
filename           = importdata(name);
%% Fit
j = 1;
for i = 11:length(filename(:,1))
    %% load data
    loadname = strcat(name(1:4),filename{i}(5:16),name(5:end));
    zBi      = flipud(load(loadname));
    Re       = str2double(filename{i}(8:16));
    Gamma    = str2double(name(19:22));
    stringPr = name(6:12);  
    stringG  = name(24:25); 
    %% parameters to set
    z              = zBi(:,1);
    Biot           = zBi(:,2);
    zEval          = linspace(-0.5+1E-5,0.5-1E-5,10000);
    zBottom        = -0.2;
    BiotFuncBottom = fitBottom(stringPr,stringG,Gamma,Re);                
    BiotFuncCold   = fitCold(stringPr,stringG,Gamma,Re);                
    BiotFuncTop    = fitTop(stringPr,stringG,Gamma,Re);            
    [zminBiotFunc, BiminBiotFunc] = fit_BiMin(stringPr, stringG, Gamma, Re);
    [zmaxBiotFunc, BimaxBiotFunc] = fit_BiMax(stringPr, stringG, Gamma, Re);
    zTop           = (0.5+zminBiotFunc)/2;
    if strcmp(name(6:12),'Pr28.84')
        BiotSumBottom   = @(z) BiotFuncBottom(z).*(tanh((z-zmaxBiotFunc)*(2*pi*2E+2))+1)/2 + ...
                               BiotFuncCold(z).*(tanh((-z+zmaxBiotFunc)*(2*pi*1E+2))+1)/2;
        BiotTotalBottom = @(z) BiotSumBottom(z) + (BimaxBiotFunc-max(BiotSumBottom(z))).*exp(-(z-zmaxBiotFunc).^2/(2*pi*5E-7));                  
        BiotBottom      = @(z) BiotTotalBottom(z).*(tanh((zBottom-z)*(2*pi*1E+3))+1)/2;
    elseif strcmp(name(6:12),'Pr69.18')
        BiotSumBottom   = @(z) BiotFuncBottom(z).*(tanh((z-zmaxBiotFunc)*(2*pi*1E+2))+1)/2 + ...
                               BiotFuncCold(z).*(tanh((-z+zmaxBiotFunc)*(2*pi*1E+2))+1)/2;
        BiotTotalBottom = @(z) BiotSumBottom(z) + (BimaxBiotFunc-max(BiotSumBottom(z))).*exp(-(z-zmaxBiotFunc).^2/(2*pi*1E-6));
        BiotBottom      = @(z) BiotTotalBottom(z).*(tanh((zBottom-z)*(2*pi*1E+3))+1)/2;
    end
    BiotTop         = @(z) BiotFuncTop(z).*(tanh((z-zTop)*(2*pi*1E+2))+1)/2;
    a               = (BiotFuncTop(zTop) - BiotFuncBottom(zBottom))/(zTop-zBottom);
    b               = BiotFuncBottom(zBottom) - a*zBottom;
    LinearMatch     = @(z) (a*z+b).*(tanh((z-zBottom)*(2*pi*1E+3))+1)/2.*...
                                    (tanh((-z+zTop)*(2*pi*1E+2))+1)/2;
    %% plot
    figure(j); 
    hold on;
    plot(Biot,z,'-k');                       
    plot(BiotTop(zEval)+BiotBottom(zEval)+LinearMatch(zEval),zEval,'--b'); 
    plot(BiminBiotFunc,zminBiotFunc,'or');
    plot(BimaxBiotFunc,zmaxBiotFunc,'or');
    xlabel('Bi(T_r_e_f=T_c_o_l_d)'), ylabel('z');  
    legend('Biot function','Biot function fit','fit extrema Biot function');
    axis([-5,1.4*max(Biot),-0.5,0.5])
    title(strcat('Biot function for Pr = ',name(8:12),', Re = ',num2str(str2double(filename{i}(8:11))),', ',name(end-4),'g'));
    j = j+1;    
end