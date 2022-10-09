rng(1); %setting the seed

m = 10.^4;
bins = 200;
N = [2, 4, 8, 16, 32, 64];

arr2 = zeros([length(N) m]);

for i = 1:length(N)
    for j = 1:m(1)
        arr2(i, j) = Y(N(i));
    end
end

for i = 1:length(N)
    hold on;
    cdfplot(arr2(i, :)); %plotting all the CDFs in the same plot
    xlabel 'Random Variable'; 
    ylabel 'Cumulative Frequency';
    title 'CDF P_Y_N(.)';
end
legend('N = 2', 'N = 4', 'N = 8', 'N = 16', 'N = 32', 'N = 64');
legend('Location', 'southeast');

for i = 1:length(N)
    figure();
    hold on;
    histogram(arr2(i, :), bins); %plotting all the histograms separately
    xlabel 'Random Variable'; 
    ylabel 'Frequency';
    title(['N = ', floor(N(i)/10) + 48,mod(N(i), 10) + 48]); %title is set using format string
    hold off;
end

function y = draw()
    real_max = 20;
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

function y = Y(N)
    y = 0;
    for i = 1:N
        y = y + draw();
    end
    y = y/N;
    return
end