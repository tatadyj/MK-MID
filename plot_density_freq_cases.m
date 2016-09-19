% plot figure 2.8 
clc 
clear all
close all

for rho = [0.1, 0.9]
    
    % density-dependent 
    R0 = 1:0.2:20; 
    Neq1 = 100./ R0 .* (1 + (1 - rho) .* (R0 - 1));

    % frequency-dependent
    Neq2 = 100.* R0 .* (1 - rho)./(R0 - rho);
    
    plot(R0, Neq1)
    hold on
    plot(R0, Neq2)
   
end

legend({'\rho = 0.1 density-dependent', '\rho = 0.1 frequency-dependent',...
    '\rho = 0.9 density-dependent', '\rho = 0.9 frequency-dependent'},'Location', 'east',...
    'FontSize', 20, 'FontWeight', 'bold')
legend('boxoff')

ylabel('Population size (% of carrying capacity)', 'FontSize',20,'FontWeight','bold')
xlabel('Basic reproductive ratio, R0', 'FontSize',20,'FontWeight','bold')
