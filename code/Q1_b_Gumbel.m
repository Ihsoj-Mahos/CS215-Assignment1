rng(1); %setting the seed

x = linspace(-10, 10, 1000);
u = 1.0; b = 2.0; %parameters of the Gumbel function
y = Gumbel(x, u, b);
z = CDF_Gumbel(x, u, b);
disp("Variance: " + variance(u, b)); %displaying the variance

hold on;
plot(x, z, 'b');
plot(x, y, 'r');
xlabel 'X values'; 
ylabel 'Y values';
legend('CDF', 'PDF');
legend('Location', 'northwest');
title 'Gumbel';
hold off;

function y = Gumbel(x, u, b)
    m = (x - u)/b;
    y = exp(-m - exp(-m))/b;
    return
end

function y = CDF_Gumbel(x, u, b)
    real_max = exp(15);
    z = Gumbel(x, u, b);
    num = length(z);
    d = (max(x)-min(x))/num;
    N = int64((x(1:1) + real_max)/d);
    v = linspace(-real_max, x(1:1), N);
    init_sum = sum(Gumbel(v, u, b)).*d;

    for i = 1:num-1
        init_sum(i+1) = init_sum(i) + z(i:i)*d;
    end
    y = init_sum;

    return
end

function k = variance(u, b)
    real_max = exp(10);
    d = 10.^-2;
    N = int64((real_max*2)/d);
    v = linspace(-real_max, real_max, N);
    z = Gumbel(v, u, b);
    e1 = sum(v.*z)/sum(z);
    e2 = sum(v.*v.*z)/sum(z);
    k = e2 - e1*e1;
    return
end

