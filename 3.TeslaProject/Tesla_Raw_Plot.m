function Raw_Plot=Raw_Graph(Date,StockData);
StockData=xlsread('Tesla_Stock_Date.xlsx');
Date=[1:1:30];
figure(1)
Data_dist=scatter(Date,StockData,'MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[0 .7 .7],...
              'LineWidth',1.5);
hold on
plot(Date,StockData)
hold on
xlabel('Date')
ylabel('Price($)')
grid on
hold off
end



