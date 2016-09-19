clc
clear all
close all

mu = 1/70./365;
beta = 1.4247;
gamma = 1/7.;
w = 1/10./365;

tspan = [0, 60*365];
y1_0 = 0.1;
y2_0 = 0.0001;
y3_0 =  1 - y1_0 - y2_0;
options = odeset('RelTol', 1e-5);
[T, Y] = ode45(@(t, y) SIRW(t, y, mu, beta, gamma, w), ...
               tspan, [y1_0, y2_0, y3_0], options);
T = T/365;

figure
ax1 = subplot(3,1,1);
ax2 = subplot(3,1,2);
ax3 = subplot(3,1,3);

plot(ax1, T, Y(:,1), 'b')
legend(ax1, {'Susceptibles'},'Location', 'southeast',...
    'FontSize', 15, 'FontWeight', 'bold')
legend(ax1, 'boxoff')

plot(ax2, T, Y(:,2), 'r')
legend(ax2, {'Infecteds'},'Location', 'northeast',...
    'FontSize', 15, 'FontWeight', 'bold')
legend(ax2, 'boxoff')


plot(ax3, T, 1-Y(:,1)-Y(:,2), 'y')
legend(ax3, {'Recovereds'},'Location', 'northeast',...
    'FontSize', 15, 'FontWeight', 'bold')
legend(ax3, 'boxoff')


xlabel('Time (years)', 'FontSize',20,'FontWeight','bold')
title(ax1, 'Fraction of population in each class', 'FontSize',20,'FontWeight','bold')

% Plot figure 2.9
clear all

wYear = 0.0001:0.0001:10;
w = wYear./365;

R0 = 10;
mu = 1/70/365;
gamma = 1/10;
beta = R0*(gamma + mu);

A_inv = (w + mu) .* (beta - gamma - mu) ./(w + mu + gamma);
GR_inv = w + mu;
GI_inv = gamma + mu;
T = 4.*pi ./sqrt(4*(R0-1) * GI_inv .* GR_inv - (GR_inv - A_inv).^2)/365;

figure 
semilogx(wYear, T)
xlabel('Rate of waning immunity, w (per year)', 'FontSize',20,'FontWeight','bold')
ylabel('Period of damped oscillations, T (years)', 'FontSize',20,'FontWeight','bold')
set(gca,'FontSize',15)

figure 
I = mu * (R0 - 1) ./(beta - R0 .* w * gamma ./(w + mu));
loglog(wYear, I)
xlabel('Rate of waning immunity, w (per year)', 'FontSize',20,'FontWeight','bold')
ylabel('Prevalence of Infection, I^{*}', 'FontSize',20,'FontWeight','bold')
set(gca,'FontSize',15)
