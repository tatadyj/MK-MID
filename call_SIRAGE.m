clc
clear all
close all

tspan = [0, 100];

Sc_0 = 0.1;
Ic_0 = 0.0001;
Sa_0 = 0.1;
Ia_0 = 0.0001;
options = odeset('RelTol', 1e-5);
[T, Y] = ode45(@SIRAGE, tspan, [Sc_0 Ic_0 Sa_0 Ia_0], options);

figure
plot(T, Y(:,1))
hold on
plot(T, Y(:,3))
legend({'Child','Adult'},'Location', 'best',...
    'FontSize', 20, 'FontWeight', 'bold')
ylabel('Susceptible individuals', 'FontSize',20,'FontWeight','bold')
xlabel('Time', 'FontSize',20,'FontWeight','bold')
set(gca,'FontSize', 15)

figure
plot(T, Y(:,2))
hold on
plot(T, Y(:,4))
legend({'Child','Adult'},'Location', 'best',...
    'FontSize', 20, 'FontWeight', 'bold')
ylabel('Infectious individuals', 'FontSize',20,'FontWeight','bold')
xlabel('Time', 'FontSize',20,'FontWeight','bold')
set(gca,'FontSize', 15)



