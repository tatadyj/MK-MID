clc
clear all
close all

tspan = [0, 30];
[T, Y] = ode45(@SIRISKV, tspan, [0.0 0.0 0.0 0.0 1e-5]);

figure
plot(T, Y(:,1))
hold on
plot(T, Y(:,2))
hold on
plot(T, Y(:,3))
hold on
plot(T, Y(:,4))
hold on
plot(T, Y(:,5))
legend({'group 1','group 2', 'group 3', 'group 4', 'group 5'},'Location', 'best',...
    'FontSize', 20, 'FontWeight', 'bold')
ylabel('Infectious individuals', 'FontSize',20,'FontWeight','bold')
xlabel('Time', 'FontSize',20,'FontWeight','bold')
set(gca,'FontSize', 15)
