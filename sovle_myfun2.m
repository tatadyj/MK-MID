clc
close all
mus = 0.01:0.002:0.05;
betas = 0.1:0.2:10;

x = zeros(length(mus), length(betas)); 

i = 1;
for mu = mus
    j = 1;
    for beta = betas
        sol = fsolve(@(x) myfun2(x, beta, mu), -0.5);
        x(i, j) = sol;
        j = j + 1;
    end
    i = i + 1;
end

figure
surf(betas, mus, x)
xlabel('Transmission Rate, \beta', 'FontSize',15,'FontWeight','bold')
ylabel('Per Capita Births, \mu', 'FontSize',15,'FontWeight','bold')
zlabel('Dominant Eigenvalue \Lambda', 'FontSize',15,'FontWeight','bold')
