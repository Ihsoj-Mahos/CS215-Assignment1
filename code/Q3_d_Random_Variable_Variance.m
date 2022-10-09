rng(0); %setting the seed

sz = 1000;
trials = 10.^3;
x = linspace(1, sz, sz);
result = zeros([1 sz]);
Variance = zeros([1 sz]);
Variance = Variance + trials * p * (1 - p); %theoritical variance
p = 0.4; %setting a random probability

for i = 1:trials(1)
    X = binornd(sz, p, [1 sz]);
    var = sum(X.*X)/length(X) - (sum(X)/length(X))^2;
    if i == 1
        result(1) = var;
        continue;
    end
    result(i) = (result(i - 1)*(i - 1) + var) / (i);
end

figure();
hold on;
plot(x, result, 'b');
plot(x, Variance, 'r');
xlabel '# Draws'; 
ylabel 'Variance';
legend('Experimental', 'Theoretical');
title 'Variance';
hold off;
