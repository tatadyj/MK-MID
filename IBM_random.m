clc
clear all
close all

N=40;
m=4;
tau=1;
gamma=0.1;
maxTime=1000;
 
% status(i) = 0 -> susceptible
% status(i) = 1 -> infectious
% status(i) = -1 -> recovereds

status = zeros(1, N);
status(1,end) = 1;     % seed of infection

X = sum(status == 0);
Y = sum(status > 0);
Z = sum(status < 0);

T = [];
XPop = [];
YPop = [];
ZPop = [];

% random sysmetric adjacent matrix G with diag elements all zeros
% G0 = round(rand(N,N));
% GUp = triu(G0);
% G = GUp + GUp';
% G = G - diag(diag(G));

% random graph with size of N by N and average contact number m
G = generate_random_graph(N, m);

sum(sum(G))/2

t = 0;
XPop(1) = X;
YPop(1) = Y;
ZPop(1) = Z;
i = 2;

while t < maxTime
    
    e = G * (status > 0)' .* (status == 0)';
    infect_rate = tau * sum(e);
    recover_rate =  gamma * sum(status > 0);
    total_rate = infect_rate + recover_rate;
    
    rand1 = rand;
    rand2 = rand;
    rand3 = rand;
    
    dt = -log(rand1)/total_rate;
    
    event = 0; 
    
    if rand2 < infect_rate/total_rate
        event = 1; % transmission 
    else
        event = 2; % recovery
    end
  
    
    
    switch event
    case 1
        
        p = find(cumsum(e) * tau >= rand3 * infect_rate, 1);
        status(p) = 1;
        
        X = X - 1;
        Y = Y + 1;
    case 2
        p = find(cumsum(status > 0)  * gamma >= rand3 * recover_rate, 1);
        status(p) = -1;
        
        Z = Z + 1;
        Y = Y - 1;
    end
        
    XPop(i) = X;
    YPop(i) = Y;
    ZPop(i) = Z;
    T(i) = t;
    
    
    
    t = t + dt;
    i = i + 1;
    
end

figure
ax1 = subplot(3,1,1);
ax2 = subplot(3,1,2);
ax3 = subplot(3,1,3);
plot(ax1, T/365, XPop, 'b')
legend(ax1, {'Susceptible'},'Location', 'best',...
    'FontSize', 10, 'FontWeight', 'bold')
plot(ax2, T/365, YPop, 'r')
legend(ax2, {'Infectious'},'Location', 'best',...
    'FontSize', 10, 'FontWeight', 'bold')
plot(ax3, T/365, ZPop, 'm')
legend(ax3, {'Recovereds'},'Location', 'best',...
    'FontSize', 10, 'FontWeight', 'bold')
xlabel('Time (years)', 'FontSize',20,'FontWeight','bold')
title(ax1, 'Fraction of population in each class', 'FontSize',20,'FontWeight','bold')

  