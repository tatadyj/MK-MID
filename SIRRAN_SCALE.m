function dydt = SIRRAN_SCALE(t, y, step, N)
    rng(12345);
    beta = 1.0;
    gamma = 1/10;
    nu = 0.02/365;
    mu = nu;
   
    dydt = zeros(2, 1);
    noise = randn(1, 5) /sqrt(step);
    dydt(1) = (nu * N + sqrt(nu * N) * noise(1)) - ...
              (beta * y(1) * y(2)/N + sqrt(beta * y(1) * y(2)/N) * noise(2)) - ...
              (mu * y(1) + sqrt(mu * y(1)) * noise(3));
          
    dydt(2) = (beta * y(1) * y(2)/N + sqrt(beta * y(1) * y(2)/N) * noise(2)) - ...
              (gamma * y(2) + sqrt(gamma * y(2)) * noise(4)) - ...
              (mu * y(2) + sqrt(mu * y(2)) * noise(5));
    
end