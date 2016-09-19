clear all
clc
close all



beta = 0.03;
gamma = 1/100;
Y0 = 70;
N0 = 100;

X = N0 - Y0;
Y = Y0;
N = N0;
tmax = 10*365;
T = [];
XPop = [];
YPop = [];
t = 0;
XPop(1) = X;
YPop(1) = Y;
i = 2;

while t <= tmax
    
    tran_rate = beta * X * Y /N;
    recover_rate = gamma * Y;
    total_rate = tran_rate + recover_rate;
    %rng(1234);

    rand1 = rand;
    rand2 = rand;

    dt = -log(rand1)/total_rate;

    if rand2 < tran_rate/total_rate
        X = X - 1;
        Y = Y + 1;
    else 
        X = X + 1;
        Y = Y - 1;
    end
    
    XPop(i) = X;
    YPop(i) = Y;
    T(i) = t ;
    
    
    t = t + dt;
    i = i + 1;
    
    

end
loglog(T/365, XPop)
hold on
loglog(T/365, YPop)
legend({'Susceptible','Infectious'},'Location', 'best',...
    'FontSize', 20, 'FontWeight', 'bold')
ylabel('Number of individuals', 'FontSize',20,'FontWeight','bold')
xlabel('Time (years)', 'FontSize',20,'FontWeight','bold')
set(gca,'FontSize', 15)
  

    



