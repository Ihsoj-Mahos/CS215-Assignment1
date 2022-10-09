% We are just creating the functions here as the problem statement states
% to just generate independent draws

rng(1); %setting the seed

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

function y = Y(N)
    y = 0;
    for i = 1:N
        y = y + draw();
    end
    y = y/N;
    return
end