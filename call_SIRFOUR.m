clc
clear all
close all

S0=[0.05 0.01 0.01 0.008];
E0=[0.0001 0.0001 0.0001 0.0001];
I0=[0.0001 0.0001 0.0001 0.0001];
R0=1-S0-E0-I0;

Send = [];
Eend = [];
Iend = [];
Rend = [];
Tend = [];
options = odeset('RelTol', 1e-3);

for t = 1:100
    tspan = [(t-1)*365, t*365];
    [T, Y] = ode45(@SIRFOUR, tspan, [S0 E0 I0 R0], options);
    
    Send = [Send; Y(:,1:4)];
    Eend = [Eend; Y(:,5:8)];
    Iend = [Iend; Y(:,9:12)];
    Rend = [Rend; Y(:,13:16)];
    Tend = [Tend; T];
    
    Q1 = Y(end,1:4:13);
    Q2 = Y(end,2:4:14);
    Q3 = Y(end,3:4:15);
    Q4 = Y(end,4:4:16);
    
    Q1 = Q1 - Q1/6;
    Q2 = Q2 + Q1/6 - Q2/4;
    Q3 = Q3 + Q2/4 - Q3/10;
    Q4 = Q4 + Q3/10;
    
    S0 = [Q1(1) Q2(1) Q3(1) Q4(1)];
    E0 = [Q1(2) Q2(2) Q3(2) Q4(2)];
    I0 = [Q1(3) Q2(3) Q3(3) Q4(3)];
    R0 = [Q1(4) Q2(4) Q3(4) Q4(4)];
end

Tend = Tend/365;

figure

plot(Tend, Send(:,1))
hold on
plot(Tend, Send(:,2))
hold on
plot(Tend, Send(:,3))
hold on
plot(Tend, Send(:,4))

legend({'0-6','6-10', '10-20', '20+'},'Location', 'best',...
    'FontSize', 15, 'FontWeight', 'bold')
ylabel('Susceptible', 'FontSize',15,'FontWeight','bold')
xlabel('Time (years)', 'FontSize',15,'FontWeight','bold')
set(gca,'FontSize', 15)


figure
semilogy(Tend, Eend(:,1))
hold on
semilogy(Tend, Eend(:,2))
hold on
semilogy(Tend, Eend(:,3))
hold on
semilogy(Tend, Eend(:,4))

legend({'0-6','6-10', '10-20', '20+'},'Location', 'best',...
   'FontSize', 15, 'FontWeight', 'bold')
ylabel('Exposeds', 'FontSize',15,'FontWeight','bold')
xlabel('Time (years)', 'FontSize',15,'FontWeight','bold')
set(gca,'FontSize', 15)


figure
semilogy(Tend, Iend(:,1))
hold on
semilogy(Tend, Iend(:,2))
hold on
semilogy(Tend, Iend(:,3))
hold on
semilogy(Tend, Iend(:,4))

legend({'0-6','6-10', '10-20', '20+'},'Location', 'best',...
   'FontSize', 15, 'FontWeight', 'bold')
ylabel('Infecteds', 'FontSize',15,'FontWeight','bold')
xlabel('Time (years)', 'FontSize', 15,'FontWeight','bold')
set(gca,'FontSize', 15)

figure
plot(Tend, Rend(:,1))
hold on
plot(Tend, Rend(:,2))
hold on
plot(Tend, Rend(:,3))
hold on
plot(Tend, Rend(:,4))
hold on
legend({'0-6','6-10', '10-20', '20+'},'Location', 'best',...
    'FontSize', 15, 'FontWeight', 'bold')
ylabel('Recovereds', 'FontSize',15,'FontWeight','bold')
xlabel('Time (years)', 'FontSize',15,'FontWeight','bold')
set(gca,'FontSize', 15)

