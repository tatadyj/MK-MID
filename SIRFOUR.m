function dydt = SIRFOUR(t, y)

    beta=[2.089 2.089 2.086 2.037; 2.089 9.336 2.086 2.037; 2.086 2.086 2.086 2.037; 2.037 2.037 2.037 2.037];
    sigma=1/8;
    gamma=1/5;
    
    nu(1)=1/(55*365); 
    nu(2:4)=0;
    mu(4)=1/(55*365);
    mu(1:3)=0;
    
    mu = mu';
    nu = nu';
    

    n=[6 4 10 55]/75;
   
    S = [y(1) y(2) y(3) y(4)]';
    E = [y(5) y(6) y(7) y(8)]';
    I = [y(9) y(10) y(11) y(12)]';
    R = [y(13) y(14) y(15) y(16)]';
   
    dydt = [ nu * n(4) - beta * I .* S - mu .* S;
            beta * I .* S - sigma * E - mu .* E;
            sigma * E - gamma * I - mu .* I;
            gamma * I - mu .* R;];
    
end