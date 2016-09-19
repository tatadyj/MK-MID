clc
clear all

mu = 1/50./365;
beta = 0.2;
gamma = 0.01;
Gamma = 0.001;
epsilon = 0.1;
q = 0.4;

tspan = [0, 60*365];
y1_0 = 0.1;
y2_0 = 0.0001;
y3_0 = 0.001;

options = odeset('RelTol', 1e-5);
[T, Y] = ode45(@(t, y) SIRC(t, y, mu, beta, gamma, Gamma, epsilon, q), ...
               tspan, [y1_0, y2_0, y3_0], options);
T = T/365;

figure
ax1 = subplot(4,1,1);
ax2 = subplot(4,1,2);
ax3 = subplot(4,1,3);
ax4 = subplot(4,1,4);

plot(ax1, T, Y(:,1), 'b')
legend(ax1, {'Susceptibles'},'Location', 'northeast',...
    'FontSize', 20, 'FontWeight', 'bold')
legend(ax1, 'boxoff')


plot(ax2, T, Y(:,2), 'r')
legend(ax2, {'Infecteds'},'Location', 'northeast',...
    'FontSize', 20, 'FontWeight', 'bold')
legend(ax2, 'boxoff')


plot(ax3, T, Y(:,3), 'y')
legend(ax3, {'Carriers'},'Location', 'northeast',...
    'FontSize', 20, 'FontWeight', 'bold')
legend(ax3, 'boxoff')

plot(ax4, T, 1 - Y(:,1) - Y(:,2) - Y(:,3), 'g')
legend(ax4, {'Recovereds'},'Location', 'northeast',...
    'FontSize', 20, 'FontWeight', 'bold')
legend(ax4, 'boxoff')

xlabel('Time (years)', 'FontSize',20,'FontWeight','bold')
title(ax1, 'Fraction of population in each class', 'FontSize',20,'FontWeight','bold')


% Plot figure 2.11
q = 0:0.01:1;
R0 = beta ./(gamma + mu) + q .*gamma ./(gamma + mu) .* epsilon .* beta ./(Gamma + mu);
Seq = (gamma + mu) ./(beta + q .*gamma .*epsilon .*beta ./(Gamma + mu));
Ieq = mu .* (1-Seq) ./(gamma + mu);
Ceq = gamma .*q .*mu .*(1-Seq) ./(gamma + mu) ./(Gamma + mu);
figure
plot(q, Seq)
hold on
plot(q, Ieq)
hold on
plot(q, Ceq)
legend({'Susceptibles','Infecteds','Carriers'},'Location', 'northeast',...
    'FontSize', 20, 'FontWeight', 'bold')
legend('boxoff')
ylabel('Proportion of population', 'FontSize',20,'FontWeight','bold')
xlabel('Fraction becoming carrier, q', 'FontSize',20,'FontWeight','bold')
set(gca,'FontSize',15)





