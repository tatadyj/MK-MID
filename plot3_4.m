clear all
close all
beta = zeros(4,4);
range = 0:0.02:1;
R0 = zeros(1, length(range));
i = 1;
for alpha = range
    beta(1,1) = (1 - alpha) * 13.9 + alpha * 5/0.2;
    beta(1,2) = (1 - alpha) * 2.78;
    beta(2,1) = (1 - alpha) * 2.78;
    beta(2,2) = (1 - alpha) * 0.556 + alpha * 1/0.8;
    beta(1,:) = beta(1, :) * 0.2;
    beta(2,:) = beta(2, :) * 0.8;
    eigval = eig(beta);
    R0(i) = max(eigval);
    i = i + 1;
end

beta = zeros(4,4);

r0 = zeros(1, length(range));
i = 1;
for alpha = range
    beta(1,1) = (1 - alpha) * 13.9 + alpha * 5/0.2;
    beta(1,2) = (1 - alpha) * 5.56;
    beta(2,1) = (1 - alpha) * 5.56;
    beta(2,2) = (1 - alpha) * 2.22 + alpha * 2/0.8;
    beta(1,:) = beta(1, :) * 0.2;
    beta(2,:) = beta(2, :) * 0.8;
    eigval = eig(beta);
    r0(i) = max(eigval);
    i = i + 1;
end
plot(range, R0)
hold on
plot(range, r0)
legend({'case 1', 'case 2'},'Location', 'best',...
    'FontSize', 15, 'FontWeight', 'bold')
xlabel('Assortative index, \alpha', 'FontSize',15,'FontWeight','bold')
ylabel('Basic reproductive ratio, R_{0}', 'FontSize',15,'FontWeight','bold')
set(gca,'FontSize', 15)
