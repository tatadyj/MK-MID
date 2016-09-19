clc
clear all
close all
n = 13;
m = 8;

tspan = [0, 30*365];
S_0 = 0.05;
I_0 = 0.00001;
I_0=I_0*ones(1,n)/n;

options = odeset('RelTol', 1e-5);
[T, Y] = ode45(@(t, y) SIRMN(t, y, m, n), tspan, [S_0, I_0], options);
T = T/365;
figure
ax1 = subplot(4,1,1);
ax2 = subplot(4,1,2);
ax3 = subplot(4,1,3);
ax4 = subplot(4,1,4);
plot(ax1, T, Y(:,1), 'b')
legend(ax1, {'Susceptibles'},'Location', 'best',...
    'FontSize', 15, 'FontWeight', 'bold')
legend(ax1, 'boxoff')




II = zeros(length(T), 1);
for i = 2:n+1
    II = II + Y(:,i);
end


plot(ax2, T, II(:,1), 'r')
legend(ax2, {'Infecteds in total'},'Location', 'best',...
    'FontSize', 15, 'FontWeight', 'bold')
legend(ax2, 'boxoff')


semilogy(ax3, T, Y(:,2:m+1), 'y')
legend(ax3, {'Exposeds'},'Location', 'best',...
    'FontSize', 15, 'FontWeight', 'bold')
legend(ax3, 'boxoff')

semilogy(ax4, T, Y(:,m+2:end), 'g')
legend(ax4, {'Infecteds'},'Location', 'best',...
    'FontSize', 15, 'FontWeight', 'bold')
legend(ax4, 'boxoff')

xlabel('Time (years)', 'FontSize',20,'FontWeight','bold')
title(ax1, 'Fraction of population in each class', 'FontSize',20,'FontWeight','bold')
