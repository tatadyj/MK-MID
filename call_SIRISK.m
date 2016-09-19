clc
clear all
close all

tspan = [0, 30];
y1_0 = 1e-8;
y2_0 = 1e-5;
[T, Y] = ode45(@SIRISK, tspan, [y1_0, y2_0]);

figure
plot(T, Y(:,1), '-o')
hold on
plot(T, Y(:,2), '-*')
hold on
legend({'High risk','Low risk'},'Location', 'best',...
    'FontSize', 20, 'FontWeight', 'bold')
ylabel('Infectious individuals', 'FontSize',20,'FontWeight','bold')
xlabel('Time', 'FontSize',20,'FontWeight','bold')
set(gca,'FontSize', 15)

figure

semilogy(T, Y(:,1), '-o')
hold on
semilogy(T, Y(:,2), '-*')
hold on
legend({'High risk','Low risk'},'Location', 'best',...
    'FontSize', 20, 'FontWeight', 'bold')
ylabel('Infectious individuals', 'FontSize',20,'FontWeight','bold')
xlabel('Time', 'FontSize',20,'FontWeight','bold')
set(gca,'FontSize', 15)


% alphas = 0:0.02:1;
% nH = 0.2;
% nL = 1 - nH;
% M = nH * 5 + nL * 1;
% V2 = (5 - M)^2 * nH + (1 - M)^2 * nL;
% 
% 
% beta1 = [13.9 2.78; 2.78 0.556];
% beta2 = [5/0.8 0; 0 1/0.2];
% for alpha = alphas
%     beta = beta1 * (1 - alpha) + beta2
%     R0 = 
% end
