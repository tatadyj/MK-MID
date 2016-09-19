function dydt = SIR(t, y)
    beta = 1.428;
    gamma = 1/7.;
    dydt = zeros(2, 1);
    dydt(1) = -beta * y(1) * y(2);
    dydt(2) = beta * y(1) * y(2) - gamma * y(2);
end