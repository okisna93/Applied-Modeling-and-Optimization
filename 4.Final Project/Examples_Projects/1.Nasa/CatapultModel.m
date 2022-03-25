clear;
clc;
%% Finding Non-linear model 

%x1 = firing angle     100 < x1 < 140
%x2 = Bungee position  100 < x2 < 200
%x3 = Pin elevation    100 < x3 < 200

%x1   x2   x3   
X = ...
[100  100  100;
100  100  200;
100  200  100;
100  200  200;
120  100  100;
120  100  200;
120  200  100;
120  200  200;
140  100  100;
140  100  200;
140  200  100;
140  200  200];

Y =[187;291;290;454;198;379;343;635;108;237;213;438];   %distance

modelfun = @(b,x)b(1) + ...   %model the polynomial f(x1,x2,x3)
    b(2)*x(:,1).^2 + ...
    b(3)*x(:,1).^1 + ...
    b(4)*x(:,2).^1 + ...
    b(5)*x(:,3).^1;


beta0 = [0 0 0 0 0];
mdl = fitnlm(X,Y,modelfun,beta0)  

% Estimated objective function 
% R-Squared = 0.94 

%% Values found from KKT
FA = 117
BP = 200
PE = 200

EstimatedDistance = -3972.7  ...
        - 0.27875*FA^2 + 65.487*FA ...
        + 1.6217*BP ...
        + 1.825*PE

%This answer is slightly off from the actual max,
%this is due to the 0.94 R-Squared vlue for the estimated model.
%Although this set of solutions finds the actual max.

syms x1 x2 x3
OM = -0.27875*x1^2 + 65.487*x1 + 1.6217*x2 + 1.825*x3;
Hessain = hessian(OM,[x1 x2 x3])       %hessian is negative semi-definite