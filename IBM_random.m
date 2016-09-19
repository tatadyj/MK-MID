clear all
close all

N=10;
m=4;
tau=1;
gamma=0.1;
maxTime=1000;
 
% status(i) = 0 -> susceptible
% status(i) = 1 -> infectious
% status(i) = -1 -> recovereds

status = zeros(1, N);
G = generate_random_graph(N, m);
sum(sum(G))/2


while t < maxTime
    
    
    infect_rate = tau * sum( G * (status > 0)' .* (status == 0) );
    recover_rate =  gamma * sum(status > 0);
    total_rate = infect_rate + recover_rate;
    dt = -log(rand)/total_rate;
    t = t + dt;
    
end

