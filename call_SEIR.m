clc
clear all

mu = 1/70./365;
beta = 1.4247;
gamma = 1/7.;
sigma = 1/14;

tspan = [0, 60*365];
y1_0 = 0.1;
y2_0 = 0.0001;
y3_0 = 0.0001;

options = odeset('RelTol', 1e-5);
[T, Y] = ode45(@(t, y) SEIR(t, y, mu, beta, gamma, sigma), ...
               tspan, [y1_0, y2_0, y3_0], options);
T = T/365;

figure
ax1 = subplot(4,1,1);
ax2 = subplot(4,1,2);
ax3 = subplot(4,1,3);
ax4 = subplot(4,1,4);

plot(ax1, T, Y(:,1), 'b')
legend(ax1, {'Susceptibles'},'Location', 'southeast',...
    'FontSize', 15, 'FontWeight', 'bold')
legend(ax1, 'boxoff')


plot(ax2, T, Y(:,2), 'r')
legend(ax2, {'Exposeds'},'Location', 'northeast',...
    'FontSize', 15, 'FontWeight', 'bold')
legend(ax2, 'boxoff')


plot(ax3, T, Y(:,3), 'y')
legend(ax3, {'Infecteds'},'Location', 'northeast',...
    'FontSize', 15, 'FontWeight', 'bold')
legend(ax3, 'boxoff')

plot(ax4, T, 1 - Y(:,1) - Y(:,2) - Y(:,3), 'g')
legend(ax4, {'Recovereds'},'Location', 'northeast',...
    'FontSize', 15, 'FontWeight', 'bold')
legend(ax4, 'boxoff')

xlabel('Time (years)', 'FontSize',20,'FontWeight','bold')
title(ax1, 'Fraction of population in each class', 'FontSize',20,'FontWeight','bold')

% plot figure 2.10

figure
latentPd = 0.01:0.02:10^4;
mu = 1/70/365;
gamma = 0.1;

sigma = 1./latentPd;
I0 = 360;
for R0 = [2, 5, 10]
    %R0 = beta * sigma /(mu + gamma)/(mu + sigma)

%     I = exp(0.5 .* latentPd .* (sqrt(4 .*(R0 -1) .* sigma .* gamma + (sigma + gamma) .^2) - ...
%         (sigma + gamma)))/365;
    I = I0 * 0.5 * (sqrt(4 .*(R0 -1) .* sigma .* gamma + (sigma + gamma) .^2) - ...
       (sigma + gamma));

    semilogx(latentPd, I)
    hold on
end


legend({'R0 = 2','R0 = 5', 'R0 = 10'},'Location', 'best',...
    'FontSize', 20, 'FontWeight', 'bold')
xlabel('Latent period, 1/\sigma, (days)', 'FontSize',20,'FontWeight','bold')
ylabel('Exponential growth rate (per year)', 'FontSize',20,'FontWeight','bold')
set(gca,'FontSize',15)






