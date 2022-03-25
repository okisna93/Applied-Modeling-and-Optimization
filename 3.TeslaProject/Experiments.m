function [fx] = objectiveFunc(x1,x2);
format short;
syms x1 x2;
fx=(x1-1)^2+2*(x2-2)^2

Hx1=1-x1^2-x2^2;   
Hx2=x1+x2;                %constraints

c=1;

Barrier_func=vpa(fx-c*(-log(Hx1)-log(Hx2)));

[x1,x2]=meshgrid(0:0.1:10,0:0.1:10);
figure(1)
hold on
fcontour(Barrier_func,'LineWidth',1) 
hold on
fcontour(fx,'LineWidth',1)
hold on
xlabel('x_(1)')
ylabel('x_(2)')
zlabel('fx')
hold on
hold on
xlim([-0.7 1])
ylim([-0.7 1])
grid on
hold on








% 
%     StockData=xlsread('Tesla_Stock_Date.xlsx');
%     PredictData=xlsread('PredictData.xlsx');
%     Date=[1:1:30];
%     figure(1)
%     Data_dist=scatter(Date,StockData,'MarkerEdgeColor',[0 .5 .5],...
%                   'MarkerFaceColor',[0 .7 .7],...
%                   'LineWidth',1.5);   
%     hold on
%     plot(Date,StockData)
%     hold on
%     y_predict=[16;2609.81540000000;-2450.28906100000;694.998077126667;101.614378566400;78.4954731922871;83.4085109156847;900.584173060655;526.465338209734;283.816473792163;1125.82937100132;615.645694488694;505.210078461766;663.049042961928;100.198199928204;634.609275574038;457.416467470634;841.767559683733;428.476885893180;749.732352970513;766.606814828673;297.650649772695;410.994850439726;355.844189214049;297.472418477945;971.540350253300;529.272832983256;536.137973629843;1073.19774147054;838.634038491472;320.119544281554];
%     iteration=[1:1:31];
%     scatter(iteration,y_predict,'filled')
%     hold on
%     setLine
%     hold on
%     xlabel('Date')
%     ylabel('Price($)')
%     hold on
%     xlim([0 30])
%     ylim([0 1000])
%     grid on
%     hold off





% 
% function [fx] = objectiveFunc(x1,x2);
% format short;
% syms x1 x2;
% fx=(x1-1)^2+2*(x2-2)^2
% fx=(x1-1)^2+2*(x2-2)^2
% Barrier_func=((x1-1)^2+2*(x2-2)^2-1*(-log(1-x1^2-x2^2)-log(x1+x2))) 
% [x1,x2]=meshgrid(0:0.1:10,0:0.1:10);
% figure(1)
% hold on
% fcontour(Barrier_func,'LineWidth',1) 
% hold on
% xlabel('x_(1)')
% ylabel('x_(2)')
% zlabel('fx')
% scatter(0.5,0.5)
% hold on
% scatter(0.5,-0.19)
% hold on
% scatter(0.46,-0.32)
% hold on
% scatter(0.4399,-0.40)
% hold on
% scatter(0.425,-0.4239)
% hold on
% xlim([-0.7 1])
% ylim([-0.7 1])
% hold on




% function Q=ObjectiveFunc(w1,w2,x);   %iteration number ekle
% syms x n w1 w2 y_stock;
% y_predict=w1+w2*x;
% % n=30;
% alpha=0.01;
% % y_stock=50;
% Q=(1/(2*n))*(y_stock-y_predict).^2;
% DeltaQ=[diff(Q,w1);diff(Q,w2)]
% wn1=w1-alpha*DeltaQ(1);
% wn2=w2-alpha*DeltaQ(2);
% y=[1;2;3;4;5;6];
% m=size(y);
% i=0;
% a=0
% while(i<=2)
%     i=i+1
%     a=1+a
%     x=sum(a)
% end

% 
% StockData=xlsread('Tesla_Stock_Date.xlsx');
% Date=[1:1:30];
% figure(1)
% Data_dist=scatter(Date,PredictPrice,'MarkerEdgeColor',[0 .5 .5],...
%               'MarkerFaceColor',[0 .7 .7],...
%               'LineWidth',1.5);
% hold on
% Data=scatter(Date,StockData,'MarkerEdgeColor',[0 .5 .5],...
%               'MarkerFaceColor',[0.7 .7 .7],...
%               'LineWidth',2);
% hold on
% xlabel('Date')
% ylabel('Price($)')
% grid on
% hold off
