function dydt = SIR(t, y, m, n)
    gamma=1/13;
    beta=17/5;
    mu=1/(55*365);
    nu = mu;
    I_mn = 0;
    
    for j = (m+2):(n+1)
        I_mn = I_mn + y(j);
    end
    
    dydt = zeros(n+1, 1);
    dydt(1) = nu - beta * y(1) * I_mn - mu * y(1);
    dydt(2) = beta * y(1) * I_mn - (gamma * n + mu) * y(2);
    for i = 3:(n+1)
        dydt(i) = gamma * n * y(i - 1) - gamma * n * y(i) - mu  * y(i);
    end
end