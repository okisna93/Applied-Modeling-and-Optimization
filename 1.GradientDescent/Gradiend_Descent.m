
function [fx] = objectiveFunc(x1,x2,x3);
tic
format short;
syms x1 x2 x3;
x=[1;1;1];
e=10^(-6); %Treshold
fx=((x1+5)^2)+((x2+8)^2)+((x3+7)^2)+2*(x1^2)*(x2^2)+4*(x1^2)*(x3^2); %Objective Function

gx=[diff(fx,x1);diff(fx,x2);diff(fx,x3)]; % Gradient Function

hx1=[diff(gx,x1)];
hx2=[diff(gx,x2)];
hx3=[diff(gx,x3)];
h=[hx1(1) hx2(1) hx3(1);hx1(2) hx2(2) hx3(2);hx1(3) hx2(3) hx3(3)]; %Hessien Function

% alfa=0.1;
true=1;
iteration=0;
value=[0 0];
while(true)
    iteration=iteration+1;
    gx_val=subs(gx,x1,x(1));
    gx_val=subs(gx_val,x2,x(2));
    gx_val=subs(gx_val,x3,x(3));
    
    h_val=subs(h,x1,x(1));
    h_val=subs(h_val,x2,x(2));
    h_val=subs(h_val,x3,x(3));
    
    alfa=vpa((gx_val'*gx_val)/(gx_val'*h_val*gx_val)); % Calculation of Alfa Iteratively
    
    second_order_cond=vpa((-gx_val')*h_val*(-gx_val)); %Calculation of Second Order Nec. Condition
                
    eucledian=norm(alfa*gx_val);
    if(e<=eucledian)
        xk1=x-alfa*gx_val;
        fk1=subs(fx,x1,xk1(1));
        fk1=subs(fk1,x2,xk1(2));
        fk1=subs(fk1,x3,xk1(3));

        x=double(xk1);
        T=table(iteration, double(alfa), x(1), x(2), x(3), double(fk1), double(second_order_cond));
        T.Properties.VariableNames = {'iteration','alfa','x1','x2','x3','obj_func','second_order'}
        
        plot_matrix= [double(iteration) double(fk1)];
        Generaltable(iteration,:)=plot_matrix;
                                        
    else
        disp('Achieved The Optimum Solution')
        true=0;
    end

toc   
end
T = array2table(Generaltable,...
    'VariableNames',{'Iteration','Objective Func'})


writematrix(Generaltable,'plot_values.xlsx');
myData=xlsread('plot_values.xlsx');
x_data=myData(:,1);
y_data=myData(:,2);
% x_data=xlsread('plot_values.xlsx','A1:A60');
% y_data=xlsread('plot_values.xlsx','B1:B60');
figure(1)
plot(x_data,y_data,'b')
grid on
axis tight
ylim([-500 5500])
xlabel(('Iteration'))
ylabel(('Objetive Function f(X)'))
hold off










% flag=1; %sign of loop
% k=0; %number of iteration
% while(flag)
%     gx_temp=subs(gx,x1,x(1));
%     gx_temp=subs(gx_temp,x2,x(1)); %initialize the previous position
%     gx_temp=subs(gx_temp,x3,x(1));
%     eucladian=norm(gx_temp);  %determine the magnitude
%     if(eucladian>=e) % when the output is less than the presicion set flag to 0 to stop else to continue
%         xk1=x-alfa*gx_temp



%flag=1; sign of loop
%k=0; number of iteration
