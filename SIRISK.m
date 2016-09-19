function dydt = SIRISK(t, y)
    gamma = 1.0;
    betaHH = 10;
    betaLL = 1;
    betaHL = 0.1;
    betaLH = 0.1;
    nH = 0.2;
    nL = 1 - nH;
    dydt = zeros(2, 1);
    dydt(1) = betaHH * (nH - y(1)) * y(1) + betaHL * (nH - y(1)) * y(2) - gamma * y(1);
    dydt(2) = betaLH * (nL - y(2)) * y(1) + betaLL * (nL - y(2)) * y(2) - gamma * y(2);
end