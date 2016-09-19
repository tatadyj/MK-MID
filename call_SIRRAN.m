clc
clear all
close all

rng(123456);

y1_0 = 1e5;
y2_0 = 500;
step = 1;

options = odeset('RelTol', 1e-5);
tspan = [0 20*365];

figure
for f = [1 2 8]
    [T, Y] = myrk4(@(t, y) SIRRAN(t, y, step, f), tspan, [y1_0 y2_0], 1);
    plot(T/365, Y(:,2))
    hold on
end
[t, y] = ode45(@SIRD_RAN, tspan, [y1_0, y2_0], options);
   
plot(t/365, y(:,2))


legend({'f = 1', 'f = 2', 'f = 8', 'no noise'},'Location', 'best',...
    'FontSize', 15, 'FontWeight', 'bold')
ylabel('Number infected', 'FontSize',20,'FontWeight','bold')
xlabel('Time (years)', 'FontSize',20,'FontWeight','bold')
set(gca,'FontSize', 15)

rangeVal = 0.1:0.2:10;
varI = zeros(1, length(rangeVal));
covarIS = zeros(1, length(rangeVal));
avgS = zeros(1, length(rangeVal));
i = 1;
covar = zeros(2,2);
for f = rangeVal
    [T, Y] = myrk4(@(t, y) SIRRAN(t, y, step, f), tspan, [y1_0 y2_0], 1);
    varI(i) = var(Y(:, 2));
    covar = cov(Y(:, 1), Y(:, 2));
    covarIS(i) = covar(1,2);
    avgS(i) = mean(Y(:, 1));
    i = i + 1;
end
fsq = rangeVal .* rangeVal;
figure

loglog(fsq, varI)
ylabel('Variance in number infected', 'FontSize',20,'FontWeight','bold')
xlabel('Variance of noise, f^{2}', 'FontSize',20,'FontWeight','bold')
set(gca,'FontSize', 15)

figure
semilogx(fsq, avgS)
ylabel('Number susceptible', 'FontSize',20,'FontWeight','bold')
xlabel('Variance of noise, f^{2}', 'FontSize',20,'FontWeight','bold')
set(gca,'FontSize', 15)


figure
loglog(fsq, covarIS)
ylabel('Covariance between infected and susceptible', 'FontSize',20,'FontWeight','bold')
xlabel('Variance of noise, f^{2}', 'FontSize',20,'FontWeight','bold')
set(gca,'FontSize', 15)

