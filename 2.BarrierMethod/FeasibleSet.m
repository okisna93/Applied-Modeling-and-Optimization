function [fx] = objectiveFunc(x1,x2);
format short;
syms x1 x2;
fx=(x1-1)^2+2*(x2-2)^2

Hx1=1-x1^2-x2^2;   
Hx2=x1+x2;                %constraints

% Hx1>0;
% Hx2>0;
c=1;

Barrier_func=vpa(fx-c*(-log(Hx1)-log(Hx2)));

% Barrier_func=((x1-1)^2+2*(x2-2)^2+1*(-log(1-x1^2-x2^2)-log(x1+x2)))


[x1,x2]=meshgrid(0:0.1:10,0:0.1:10);
x1_star=[0.5;0.477246710598738;0.454542587320877;0.425055580812187;
    0.409806981854259;0.406951822792986;0.405929946553333;
    0.405158694084877;0.404857678571346;
    0.404593862053492;0.404497481512162];
x2_star=[0.5;0.771753849342612;0.744546914117227;0.808252491102263;
    0.841833745783656;0.867120968990320;0.885676874610815;
    0.896940461940466;0.904415322882973;0.908625142331228;
    0.911300888629286];
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
scatter(x1_star,x2_star,'filled')

hold on
xlim([-0.7 1])
ylim([-0.7 1])
grid on
hold on