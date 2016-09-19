function dydt = SIRC(t, y, mu, beta, gamma, Gamma, epsilon, q)

    dydt = zeros(3, 1);
    dydt(1) = mu - ( beta * y(2) + epsilon * beta * y(3) ) * y(1) - mu * y(1);
    dydt(2) = ( beta * y(2) + epsilon * beta * y(3) ) * y(1) - gamma * y(2) - mu * y(2);
    dydt(3) = gamma * q * y(2) - Gamma * y(3) - mu * y(3);
    %dydt(4) = gamma * (1 - q) * y(2) + Gamma * y(3) - mu * y(4);
end