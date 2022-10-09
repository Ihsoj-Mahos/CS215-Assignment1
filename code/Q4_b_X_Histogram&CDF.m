rng(1); %setting the seed

m = 10.^5;
arr1 = zeros([1 m]);
bins = 200;

for i = 1:m(1)
    arr1(i) = draw();
end

cdfplot(arr1); %plotting the CDF
xlabel 'Random Variable'; 
ylabel 'Cumulative Frequency';
title 'CDF P_X(.)';

figure();
hold on;
histogram(arr1, bins); %plotting the histogram with 200 bins
xlabel 'Random Variable';
ylabel 'Frequency';
title 'Empirical PDF';
hold off;

function y = draw()
    real_max = 99;
    arr = zeros([1 (real_max * (real_max + 1)) / 2]);
    
    for i = 1:real_max(1)
        for j = 1:i
            arr(i * (i - 1) / 2 + j) = i * (2 * mod(j, 2) - 1);
        end
    end
    
    arr = arr / real_max;
    index = ceil(rand() * real_max * (real_max + 1) / 2);
    y = arr(index);
    return
end