rng(1); %setting the seed

N_arr = [5, 10, 20, 40, 60, 80, 100, 500, 1000, 10000];
M = 100;
err_mat = zeros([M length(N_arr)]);
mu = 0; %parameters of the Gaussian function
sigma = 1;

for i = 1:M
    for j = 1:length(N_arr)
        err_mat(i, j) = compute(N_arr(j), mu, sigma);
    end
end

figure(); %plotting the box-and-whisker plot
boxplot(err_mat, N_arr);
xlabel 'Sample Size'; 
ylabel 'Error';
title 'Gaussian';

function err = compute(N, mu, sigma)
    dist = zeros([1 N]);
    for i = 1:N
        dist(i) = normrnd(mu, sigma);
    end
    mean = sum(dist)/length(dist);
    err = abs(mean - mu);
    return
end