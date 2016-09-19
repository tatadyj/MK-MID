clc
tspan = [0, 70];
y1_0 = 0.9999;
y2_0 = 0.0001;
[T, Y] = ode45(@SIR, tspan, [y1_0, y2_0]);
T = T/7.;
figure
plot(T, Y(:,1), 'o')
hold on
plot(T, Y(:,2), '*')
hold on
plot(T, 1-Y(:,1)-Y(:,2), '+')
legend({'Susceptibles','Infecteds','Recovereds'},'Location', 'northeast',...
    'FontSize', 20, 'FontWeight', 'bold')
ylabel('Fraction of population in each class', 'FontSize',20,'FontWeight','bold')
xlabel('Time (weeks)', 'FontSize',20,'FontWeight','bold')
set(gca,'FontSize',15)
