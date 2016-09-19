function dydt = SIRM2(t, y)
    nu = 1/70./365;
    mu = 1/70./365;
    beta = 1.4247;
    gamma = 1/7.;
    rho = 0.5;
    dydt = zeros(3, 1);
    dydt(1) = nu - beta * y(1) * y(2)/(y(1) + y(2) + y(3)) - mu * y(1);
    dydt(2) = beta * y(1) * y(2)/(y(1) + y(2) + y(3)) - (gamma + mu)/(1-rho) * y(2);
    dydt(3) = gamma * y(2) - mu * y(3);
end