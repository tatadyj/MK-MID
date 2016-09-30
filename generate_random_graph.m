function [G] = generate_random_graph(N, m)
G = zeros(N, N);
connects = 0;
while(connects < m*N)
    i = randi([1, N]);
    j = randi([1, N]);
    if i ~= j & G(i,j) ~= 1
        G(i,j) = 1; 
        G(j,i) = 1;
        connects = connects + 2;
    end
end
           
 