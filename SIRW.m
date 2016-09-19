function dydt = SIRW(t, y, mu, beta, gamma, w)

    dydt = zeros(3, 1);
    dydt(1) = mu + w * y(3) -beta * y(1) * y(2) - mu * y(1);
    dydt(2) = beta * y(1) * y(2) - gamma * y(2) - mu * y(2);
    dydt(3) = gamma * y(2) - w * y(3) - mu * y(3);
end