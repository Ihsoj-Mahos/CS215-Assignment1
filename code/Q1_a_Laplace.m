rng(1); %setting the seed

x = linspace(-10, 14, 1000); 
u = 2.0; b = 2.0; %parametres of the Laplace function
y = Laplace(x, u, b);
z = CDF_Laplace(x, u, b);

disp("Variance: " + variance(u, b)); %displaying the variance

[~, idx] = min( abs(z - 0.5) ); %finding median and comparing against the expected value
p = x(idx);
q = z(idx);

hold on;
plot(x, z, 'b');
plot(x, y, 'r');
plot(p, q, 'o', 'Markersize', 10, 'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'g'); %marking the median
xlabel 'X values'; 
ylabel 'Y values';
legend('CDF', 'PDF', 'Median');
legend('Location', 'northwest');
title 'Laplace';
hold off;

function y = Laplace(x, u, b)
    y = exp(-abs(x-u)/b)/(2*b);
    return
end

function y = CDF_Laplace(x, u, b)
    real_max = exp(15);
    z = Laplace(x, u, b);
    num = length(z);
    d = (max(x)-min(x))/num;
    N = int64((x(1:1) + real_max)/d);
    v = linspace(-real_max, x(1:1), N);
    init_sum = sum(Laplace(v, u, b)).*d;

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
    z = Laplace(v, u, b);
    e1 = sum(v.*z)/sum(z);
    e2 = sum(v.*v.*z)/sum(z);
    k = e2 - e1*e1;
    return
end

