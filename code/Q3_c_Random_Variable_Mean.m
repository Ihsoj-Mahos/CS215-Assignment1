rng(0); %setting the seed

sz = 10.^3;
trials = 10.^3;
p = 0.4; %setting a random probability
x = linspace(1, trials, trials);
result = zeros([1 trials]);
Expectation = zeros([1 trials]);
Expectation = Expectation + trials * p; %theoritical expectation

for i = 1:trials(1)
    X = binornd(sz, p, [1 sz]);
    mean = sum(X)/length(X);
    if i == 1
        result(1) = mean;
        continue;
    end
    result(i) = (result(i - 1)*(i - 1) + mean) / (i);
end

figure();
hold on;
plot(x, result, 'b');
plot(x, Expectation, 'r');
xlabel '# Draws'; 
ylabel 'Expectation';
legend('Experimental', 'Theoretical');
title 'Mean';
hold off;