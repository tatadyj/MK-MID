clc
close all
clear all
tspan = [0, 70];
y1_0 = 0.9999;
y2_0 = 0.0001;
step = 0.05;
[T, Y] = myrk4(@(t, y) SIRACUM(t, y, step), tspan, [y1_0, y2_0, 0], step);
T = T;
figure
plot(T, Y(:,1), 'o')
hold on
plot(T, Y(:,2), '*')
hold on
plot(T, 1-Y(:,1)-Y(:,2), '+')
hold on
plot(T, Y(:,3), 'o')
hold on 
plot(T, cumsum(Y(:,2)*step), '*')
legend({'Susceptibles','Infecteds','Recovereds'},'Location', 'northeast',...
    'FontSize', 20, 'FontWeight', 'bold')
ylabel('Fraction of population in each class', 'FontSize',20,'FontWeight','bold')
xlabel('Time (weeks)', 'FontSize',20,'FontWeight','bold')
set(gca,'FontSize',15)


% figure
% plot(T, cumsum(Y(:,2))-Y(:,3))