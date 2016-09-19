clc
close all
R0range = 0:0.1:5;
x = zeros(1, length(R0range));
i = 1;
for R0 = R0range
    x(i) = fsolve(@(x) myfun(x, R0), 0.5);
    i = i + 1;
end

plot(R0range, x, '-ro')
xlabel('Basic Reproductive Ratio, R0', 'FontSize',20,'FontWeight','bold')
ylabel('Fraction Infected', 'FontSize',20,'FontWeight','bold')
