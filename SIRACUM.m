function dydt = SIRACUM(t, y, step)
    beta = 1.428;
    gamma = 1/7.;
    dydt = zeros(3, 1);
    dydt(1) = -beta * y(1) * y(2);
    dydt(2) = beta * y(1) * y(2) - gamma * y(2);
    dydt(3) = dydt(3) + y(2);
end