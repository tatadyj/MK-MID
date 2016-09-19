clc
clear all
close all

tspan = [0, 60*365];
y1_0 = 0.1;
y2_0 = 2.5e-4;
options = odeset('RelTol', 1e-5);
[T, Y] = ode45(@SIRD, tspan, [y1_0, y2_0], options);
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


plot(ax3, T, 1-Y(:,1)-Y(:,2), 'y')
legend(ax3, {'Recovereds'},'Location', 'northeast',...
    'FontSize', 20, 'FontWeight', 'bold')
legend(ax3, 'boxoff')

xlabel('Time (years)', 'FontSize',20,'FontWeight','bold')
title(ax1, 'Fraction of population in each class', 'FontSize',20,'FontWeight','bold')


% plot figure 2.7
figure
for inv_mu = 40:20:80
    R0 = 2:0.1:20;
    A = inv_mu./(R0-1);
    plot(R0, A);
    hold on
end
legend({'1/\mu = 40 yrs', '1/\mu = 60 yrs', '1/\mu = 80 yrs' },'Location', 'northeast',...
    'FontSize', 20, 'FontWeight', 'bold')
legend('boxoff')

ylabel('Mean age at infection, A (years)', 'FontSize',20,'FontWeight','bold')
xlabel('Basic reproductive ratio, R0', 'FontSize',20,'FontWeight','bold')


