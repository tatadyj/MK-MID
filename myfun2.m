function y = myfun2(x, beta, mu)
    S = mu/(1 - exp(-1 * beta * mu));
    I = mu;
    fac = exp(-1 * beta * I);
    y = x^3 - fac * x^2 - beta * S * fac * x + ... 
        beta * S * fac;
end