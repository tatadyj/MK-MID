clc
clear all
close all

tspan = [0, 100];
n = [0.06 0.31 0.52 0.08 0.03]
y0 = [0.06 0.31 0.52 0.08 0.03 0 0 0 0 1e-5 0 0 0 0 0];
[T, Y] = ode45(@example_one, tspan, y0);

figure
plot(T, Y(:,1)/n(1))
hold on
plot(T, Y(:,2)/n(2))
hold on
plot(T, Y(:,3)/n(3))
hold on
plot(T, Y(:,4)/n(4))
hold on
plot(T, Y(:,5)/n(5))
legend({'group 1','group 2', 'group 3', 'group 4', 'group 5'},'Location', 'best',...
    'FontSize', 20, 'FontWeight', 'bold')
ylabel('Susceptible', 'FontSize',20,'FontWeight','bold')
xlabel('Time', 'FontSize',20,'FontWeight','bold')
set(gca,'FontSize', 15)


figure
plot(T, Y(:,6))
hold on
plot(T, Y(:,7))
hold on
plot(T, Y(:,8))
hold on
plot(T, Y(:,9))
hold on
plot(T, Y(:,10))
legend({'group 1','group 2', 'group 3', 'group 4', 'group 5'},'Location', 'best',...
    'FontSize', 20, 'FontWeight', 'bold')
ylabel('Infectious', 'FontSize',20,'FontWeight','bold')
xlabel('Time', 'FontSize',20,'FontWeight','bold')
set(gca,'FontSize', 15)


figure
plot(T, Y(:,11))
hold on
plot(T, Y(:,12))
hold on
plot(T, Y(:,13))
hold on
plot(T, Y(:,14))
hold on
plot(T, Y(:,15))
legend({'group 1','group 2', 'group 3', 'group 4', 'group 5'},'Location', 'best',...
    'FontSize', 20, 'FontWeight', 'bold')
ylabel('AIDS', 'FontSize',20,'FontWeight','bold')
xlabel('Time', 'FontSize',20,'FontWeight','bold')
set(gca,'FontSize', 15)
