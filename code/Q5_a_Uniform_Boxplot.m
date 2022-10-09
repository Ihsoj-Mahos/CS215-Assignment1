rng(1); %setting the seed

N_arr = [5, 10, 20, 40, 60, 80, 100, 500, 1000, 10000];
M = 100;
err_mat = zeros([M length(N_arr)]);

for i = 1:M
    for j = 1:length(N_arr)
        err_mat(i, j) = compute(N_arr(j));
    end
end

figure(); %plotting the box-and-whisker plot
boxplot(err_mat, N_arr);
xlabel 'Sample Size'; 
ylabel 'Error';
title 'Uniform Random';

function err = compute(N)
    dist = zeros([1 N]);
    for i = 1:N
        dist(i) = rand();
    end
    mean = sum(dist)/length(dist);
    err = abs(mean - 0.5);
    return
end