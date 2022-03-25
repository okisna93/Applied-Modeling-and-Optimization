function [AugmentedFunc] = BarrierFunc(x1,x2,c);
format short;
syms x1 x2 c;
fx=(x1-1)^2+2*(x2-2)^2;

Hx1=1-x1^2-x2^2;   
Hx2=x1+x2;                %constraints

x=[0.5 0.5];
e=0.002;
c=1;


true=1;
iteration=0;
    while(true)
        iteration=iteration+1;
        
        Barrier_func=(fx+c*(-log(Hx1)-log(Hx2))^2);
        Delta_Barrier=[diff(Barrier_func,x1);diff(Barrier_func,x2)];

        HessienBarrier=[diff(Delta_Barrier(1),x1) diff(Delta_Barrier(1),x2);
            diff(Delta_Barrier(2),x1) diff(Delta_Barrier(2),x2)];
        
        
        Delta_Barrier_val=subs(Delta_Barrier,x1,x(1));
        Delta_Barrier_val=subs(Delta_Barrier_val,x2,x(2));

        Hessien_val=subs(HessienBarrier,x1,x(1));
        Hessien_val=subs(Hessien_val,x2,x(2));
        

        alpha=vpa((Delta_Barrier_val'*Delta_Barrier_val)/(Delta_Barrier_val'*Hessien_val*Delta_Barrier_val)); % Calculation of Alpha Iteratively
        
        eucledian=norm(alpha*Delta_Barrier_val);
        if(e<=eucledian);
            fx_val=subs(fx,x1,x(1));
            fx_val=subs(fx_val,x2,x(2));
                       
            stepsize1=alpha*Delta_Barrier_val(1);
            stepsize2=alpha*Delta_Barrier_val(2);
            
            x1_new=vpa(x(1)-stepsize1);
            x2_new=vpa(x(2)-stepsize2);
            x=[x1_new x2_new];
            
            c=c*0.5;

            result_matrix= [double(iteration) double(x(1)) double(x(2)) double(fx_val)];
            ResultTable(iteration,:)=result_matrix;
        else
            true=0;
        end
    end
    GeneralTable = array2table(ResultTable,...
        'VariableNames',{'Iteration','x1','x2','f(x)'})
    writematrix(ResultTable,'IterationData.xlsx');
end
        
