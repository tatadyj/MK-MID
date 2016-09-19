function dydt = example_one(t, y)
    mu = 0.0312;
    n = [0.06 0.31 0.52 0.08 0.03]';
    nu = mu * n;
    gamma = 0.2;
    m = 1;
    d = 0.3;
    beta0 = 0.0217;
    
    beta = beta0 * [0 0 0 0 0; 0 0.65 2.15 12.9 21.5; 0 2.15 7.17 43.1 71.8; ...
              0 12.9 43.1 258 431; 0 21.5 71.8 431 718]
          
    S = [y(1) y(2) y(3) y(4) y(5)]';        
    I = [y(6) y(7) y(8) y(9) y(10)]';  
    A = [y(11) y(12) y(13) y(14) y(15)]';
    
    dydt = [nu - beta * I .* S - mu * S;
            beta * I .* S - (mu + gamma) * I; 
            gamma * d * I - (mu + m) * A];
end