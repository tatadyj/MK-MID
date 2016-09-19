clc
clear all
close all

tspan = [0, 60*365];
y1_0 = 0.2;
y2_0 = 1e-4;
y3_0 = 1-y1_0-y2_0;
options = odeset('RelTol', 1e-5);
[T, Y] = ode45(@SIRM1, tspan, [y1_0, y2_0, y3_0], options);
T = T/365;
figure
ax1 = subplot(3,1,1);
ax2 = subplot(3,1,2);
ax3 = subplot(3,1,3);
plot(ax1, T, Y(:,1), 'b')
legend(ax1, {'Susceptibles'},'Location', 'northeast',...
    'FontSize', 20, 'FontWeight', 'bold')
legend(ax1, 'boxoff')


plot(ax2, T, Y(:,2), 'r')
legend(ax2, {'Infecteds'},'Location', 'northeast',...
    'FontSize', 20, 'FontWeight', 'bold')
legend(ax2, 'boxoff')


plot(ax3, T, Y(:,3), 'y')
legend(ax3, {'Recovereds'},'Location', 'northeast',...
    'FontSize', 20, 'FontWeight', 'bold')
legend(ax3, 'boxoff')

xlabel('Time (years)', 'FontSize',20,'FontWeight','bold')
title(ax1, 'Fraction of population in each class', 'FontSize',20,'FontWeight','bold')

