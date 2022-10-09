rng(1); %setting the seed

x = linspace(-10, 10, 1000);
x1 = linspace(3, 6, 100);
x0 = 0; g = 1; %parameters of the Cauchy function
y = Cauchy(x, x0, g);
z = CDF_Cauchy(x, x0, g);
z1 = variance(x1, x0, g);

figure();
hold on;
plot(x, z, 'b');
plot(x, y, 'r');
xlabel 'X values'; 
ylabel 'Y values';
legend('CDF', 'PDF');
legend('Location', 'northwest');
title 'Cauchy';
hold off;

figure(); %plotting variance as a function of input size to show that it diverges
hold on;
plot(x1, z1, 'p', 'Markersize', 5, 'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'g');
xlabel 'log(input size)'; 
ylabel 'Variance';
title 'Cauchy';
hold off;

function y = Cauchy(x, x0, g)
    m = (x - x0)/g;
    y = 1./(pi * (1 + m.^2));
    return
end

function y = CDF_Cauchy(x, x0, g)
    real_max = exp(15);
    z = Cauchy(x, x0, g);
    num = length(z);
    d = (max(x)-min(x))/num;
    N = int64((x(1:1) + real_max)/d);
    v = linspace(-real_max, x(1:1), N);
    init_sum = sum(Cauchy(v, x0, g)).*d;

    for i = 1:num-1
        init_sum(i+1) = init_sum(i) + z(i:i)*d;
    end
    y = init_sum;

    return
end

function k = variance(x1, x0, g)
    real_max = 10.^x1;
    d = 10.^-2;
    k = zeros([1 length(real_max)]);
    for i = 1:length(real_max)
        N = int64((real_max(i:i)*2)/d);
        v = linspace(-floor(real_max(i:i)), floor(real_max(i:i)), N);
        z = Cauchy(v, x0, g);
        e1 = sum(v.*z)/sum(z);
        e2 = sum(v.*v.*z)/sum(z);
        k(i) = e2 - e1*e1;
    end
    return
end

