function dydt = SIRAGE(t, y)
    beta=[100 10; 10 20];
    gamma=10;
    lC=0.066667;
    mu=[0 0.0166667];
    betaCC = beta(1,1);
    betaCA = beta(1,2);
    betaAC = beta(2,1);
    betaAA = beta(2,2);
    muC = mu(1);
    muA = mu(2);
    nC = muA/(lC+muA);
    nA = 1 - nC;
    nu = (lC + muA)*nC;

    
 
    dydt = zeros(4, 1);
    dydt(1) = nu - y(1) * (betaCC * y(2) + betaCA * y(4)) - (muC + lC) * y(1);
    dydt(2) = y(1) * (betaCC * y(2) + betaCA * y(4)) - (gamma + muC + lC) * y(2);
    dydt(3) = lC * y(1) - y(3) * (betaAC * y(2) + betaAA * y(4)) - muA * y(3);
    dydt(4) = lC * y(2) + y(3) * (betaAC * y(2) + betaAA * y(4)) - (gamma + muA) * y(4);
end