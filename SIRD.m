function dydt = SIRD(t, y)
    mu = 1/70./365;
    beta = 1.4247;
    gamma = 1/7.;
    dydt = zeros(2, 1);
    dydt(1) = mu - beta * y(1) * y(2) - mu * y(1);
    dydt(2) = beta * y(1) * y(2) - gamma * y(2) - mu * y(2);
end