clc
clear all
close all

%rng(123456);
step = 1;

tspan = [0 5*365];

y1_0 = 1e5;
y2_0 = 200;

%NRange = logspace(4, 8, 100);
NRange = [1e5 1e6 1e7 1e8 1e9 1e10]
avgI = zeros(length(NRange));
varI = zeros(length(NRange));

i = 1;
figure
for N = NRange
    
    [T, Y] = myrk4(@(t, y) SIRRAN_SCALE(t, y, step, N), tspan, [y1_0 y2_0], step);
    avgI(i) = mean(Y(:, 2));
    varI(i) = var(Y(:, 2));
    i = i + 1;
    i
    semilogy(T/365, Y(:,2))
    hold on
end
%[t, y] = ode45(@SIRD_RAN, tspan, [y1_0, y2_0], options);
   
%plot(t/365, y(:,2))


legend({'N = 1e5', 'N = 1e6', 'N = 1e7', 'N = 1e8'},'Location', 'best',...
     'FontSize', 15, 'FontWeight', 'bold')
ylabel('Number infected', 'FontSize',20,'FontWeight','bold')
xlabel('Time (years)', 'FontSize',20,'FontWeight','bold')
set(gca,'FontSize', 15)
% 
% rangeVal = 0.1:0.2:10;
% varI = zeros(1, length(rangeVal));
% covarIS = zeros(1, length(rangeVal));
% avgS = zeros(1, length(rangeVal));
% i = 1;
% covar = zeros(2,2);
% for f = rangeVal
%     [T, Y] = myrk4(@(t, y) SIRRAN_SCALE(t, y, step), tspan, [y1_0 y2_0 y3_0], 1);
%     varI(i) = var(Y(:, 2));
%     covar = cov(Y(:, 1), Y(:, 2));
%     covarIS(i) = covar(1,2);
%     avgS(i) = mean(Y(:, 1));
%     i = i + 1;
% end
% fsq = rangeVal .* rangeVal;
% figure
% 
figure
loglog(avgI, varI, 'o')
ylabel('Variance of number infected', 'FontSize',20,'FontWeight','bold')
xlabel('Mean number infected', 'FontSize',20,'FontWeight','bold')
set(gca,'FontSize', 15)

% figure
% semilogx(fsq, avgS)
% ylabel('Number susceptible', 'FontSize',20,'FontWeight','bold')
% xlabel('Variance of noise, f^{2}', 'FontSize',20,'FontWeight','bold')
% set(gca,'FontSize', 15)
% 
% 
% figure
% loglog(fsq, covarIS)
% ylabel('Covariance between infected and susceptible', 'FontSize',20,'FontWeight','bold')
% xlabel('Variance of noise, f^{2}', 'FontSize',20,'FontWeight','bold')
% set(gca,'FontSize', 15)

