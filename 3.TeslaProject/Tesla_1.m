
function [Q]=ObjectiveFunc(w1,w2,x,iteration); 
syms x w1 w2 y_stock;
y_data=xlsread('Tesla_Stock_Date.xlsx');
format longG;

w1=0;
w2=1;
alpha=0.01;
iteration=30;
i=0;

    while(i<=iteration); 
        i=i+1
        k=randi([1 30],1,1);
        x=[1:1:30]';
        y_stock=y_data(k);
        x_date=x(k);
        n=size(y_data);
        
        y_predict=(w1+w2*x_date);
        Q=vpa((y_stock-y_predict).^2)*(1/(2*i));
        
        DeltaQ_1=sum((2*w1 - 2*y_stock + 2*w2*x_date)/(2*i));
        DeltaQ_2=sum((x_date*(w1 - y_stock + w2*x_date))/i);

        stepsize_w1=vpa(alpha*DeltaQ_1);
        stepsize_w2=vpa(alpha*DeltaQ_2);
        
        w1=(w1-stepsize_w1);
        w2=(w2-stepsize_w2);
        
        Matrix=[i y_predict];
        GeneralTable(i,:)=Matrix;
        k=randi([1 30],1,1);
    end    
    
    ResultTable= array2table(GeneralTable,...
        'VariableNames',{'Iteration','y_stock'})
    writetable(ResultTable,'PredictData.xlsx');
    
    %Update Edilecek
    MatrixWrite=xlswrite('PredictData.xlsx',ResultTable);
    StockData=xlsread('Tesla_Stock_Date.xlsx');
    PredictData=xlsread('PredictData.xlsx');
    Date=[1:1:30];
    figure(1)
    Data_dist=scatter(Date,StockData,'MarkerEdgeColor',[0 .5 .5],...
                  'MarkerFaceColor',[0 .7 .7],...
                  'LineWidth',1.5);   
    hold on
    plot(Date,StockData)
    hold on
    y_predict=[16;2609.81540000000;-2450.28906100000;694.998077126667;101.614378566400;78.4954731922871;83.4085109156847;900.584173060655;526.465338209734;283.816473792163;1125.82937100132;615.645694488694;505.210078461766;663.049042961928;100.198199928204;634.609275574038;457.416467470634;841.767559683733;428.476885893180;749.732352970513;766.606814828673;297.650649772695;410.994850439726;355.844189214049;297.472418477945;971.540350253300;529.272832983256;536.137973629843;1073.19774147054;838.634038491472;320.119544281554];
    iteration=[1:1:31];
    scatter(iteration,y_predict,'filled')
    hold on
    xlabel('Date')
    ylabel('Price($)')
    hold on
    xlim([0 30])
    ylim([0 1000])
    grid on
    hold off
end












