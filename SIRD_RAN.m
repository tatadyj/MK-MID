function dydt = SIRD_RAN(t, y)

    beta = 1.0;
    gamma = 1/10;
    nu = 0.02/365;
    mu = nu;
    N = 1e6;
    dydt = zeros(2, 1);

    dydt(1) = nu * N - (beta * y(1) * y(2)/N) - mu * y(1) ;
    dydt(2) = (beta * y(1) * y(2)/N) - gamma * y(2) - mu * y(2);
       
end