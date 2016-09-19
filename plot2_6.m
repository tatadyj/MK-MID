clc
clear all
close all

% Plot figure 2.6
IPs = 5:2:20;
betas = 100:100:1000;
mat = zeros(length(betas), length(IPs));

i = 1;
for beta = betas
    j = 1;
    for IP = IPs
        betaDay = beta/365;
        gamma = 1/IP;
        mu = 1/70/365;
        R0 = betaDay/(mu + gamma);
        A = 1/mu/(R0-1);
        G = 1/(mu + gamma);
        mat(i, j) =  2*pi*sqrt(A*G)/365;
        j = j + 1;
    end
    i = i + 1;
end
figure
surf(IPs, betas, mat)


% plot line
clear all

clear all

IPs = 5:0.1:20;
betas = 100:2:1000;

i = 1;
m = 1;
index_i = [];
index_j = [];
arrayLine = [];

for beta = betas
    j = 1;
    for IP = IPs
        betaDay = beta/365;
        gamma = 1/IP;
        mu = 1/70/365;
        R0 = betaDay/(mu + gamma);
        A = 1/mu/(R0-1);
        G = 1/(mu + gamma);
        val =  2*pi*sqrt(A*G)/365;
        tol = 0.01;
        if abs(R0 - 15) < tol > 0
            index_i(m) = beta;
            index_j(m) = IP;
            arrayLine(m) = val;
            m = m + 1;
            
        end
        j = j + 1;
    end
    i = i + 1;
end
hold on
plot3(index_j, index_i, arrayLine, 'r', 'LineWidth', 2)
xlabel('Infectious Period (days)', 'FontSize',15,'FontWeight','bold')
ylabel('Transimission Rate, \beta (per year)', 'FontSize',15,'FontWeight','bold')
zlabel('Period of Oscillations (years)', 'FontSize',15,'FontWeight','bold')

