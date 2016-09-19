function dydt = SEIR(t, y, mu, beta, gamma, sigma)

    dydt = zeros(3, 1);
    dydt(1) = mu - beta * y(1) * y(3) - mu * y(1);
    dydt(2) = beta * y(1) * y(3) - (sigma + mu) * y(2);
    dydt(3) = sigma * y(2) - (mu + gamma) * y(3);
end