rng(1); %setting the seed

lambda = 4;
prob = 0.8;
sz = 10.^5;
real_max = 26; %k varies from 0 to 25, so 26 values are needed to be printed

Y = poissrnd(lambda, 1, sz);
Z_theo = poissrnd(lambda * prob, 1, sz);

x = uint64(0):uint64(real_max - 1);
y = zeros([1 real_max]);
y_theo = zeros([1 real_max]);

for i = 1:sz(1)
    r = binornd(Y(i:i), prob); %letting only 80% of the hits to pass through
    if (r >= 0) && (r <= real_max - 1) %so that out-of-bound index error does not occur
        y(r + 1) = y(r + 1) + 1;
    end
    r_theo = Z_theo(i:i);
    if (r_theo >= 0) && (r_theo <= real_max - 1) %so that out-of-bound index error does not occur
       y_theo(r_theo + 1) = y_theo(r_theo + 1) + 1;
    end
end

y = y./sz;
y_theo = y_theo./sz;
disp("Experimental Values:"); %comparing the experimental and theoritical values
disp(y);
disp("Theoretical Values:");
disp(y_theo);
disp("Absolute Difference:");
disp(abs(y - y_theo));

figure(); %plotting the experimental and theoritical values
hold on;
plot(x, y, 'r');
plot(x, y_theo, 'b');
xlim([0 real_max - 1]);
ylim([0 max(y) + 0.1]);
xlabel 'X values'; 
ylabel 'Y values';
legend('Experimental', 'Theoretical');
title 'Poisson Thinning';
hold off;