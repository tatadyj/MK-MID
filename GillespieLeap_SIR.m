clear all
clc
close all



beta = 1;
gamma = 1/10;
mu = 5e-4;
N0 = 5000; 

Y0=ceil(mu*N0/gamma);
X0=floor(gamma*N0/beta);

X = X0;
Y = Y0;
Z = N0 - X0 - Y0;
N = N0; % constant during simulations
tau = 1;

tmax = 2*365;
T = [];
XPop = [];
YPop = [];
ZPop = [];
t = 0;
XPop(1) = X;
YPop(1) = Y;
ZPop(1) = Z;
i = 2;

while t <= tmax
    
    tran_rate = beta * X * Y /N;
    recover_rate = gamma * Y;
    birth_rate = mu * N;
    death_s_rate = mu * X;
    death_i_rate = mu * Y;
    death_r_rate = mu * Z;
    
    tranRN = poissrnd(tran_rate * tau);
    recoRN = poissrnd(recover_rate * tau);
    birtRN = poissrnd(birth_rate * tau);
    detsRN = poissrnd(death_s_rate * tau);
    detiRN = poissrnd(death_i_rate * tau);
    detrRN = poissrnd(death_r_rate * tau);

    X = X - tranRN - detsRN + birtRN;
    Y = Y + tranRN - recoRN - detiRN;
    Z = Z + recoRN - detrRN;
    
    XPop(i) = X;
    YPop(i) = Y;
    ZPop(i) = Z;
    T(i) = t ;
    
    
    t = t + tau;
    i = i + 1;
    
    

end

figure
ax1 = subplot(3,1,1);
ax2 = subplot(3,1,2);
ax3 = subplot(3,1,3);
plot(ax1, T/365, XPop, 'b')
legend(ax1, {'Susceptible'},'Location', 'best',...
    'FontSize', 10, 'FontWeight', 'bold')
plot(ax2, T/365, YPop, 'r')
legend(ax2, {'Infectious'},'Location', 'best',...
    'FontSize', 10, 'FontWeight', 'bold')
plot(ax3, T/365, ZPop, 'm')
legend(ax3, {'Recovereds'},'Location', 'best',...
    'FontSize', 10, 'FontWeight', 'bold')
xlabel('Time (years)', 'FontSize',20,'FontWeight','bold')
  