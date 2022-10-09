rng(1); %setting the seed

sz = 10.^3;
pos = zeros([1 sz]);
trials = 10.^3;
step = 10.^-3;
x = linspace(1, trials(1), trials(1));
Y = zeros([trials sz]);

for i = 1:trials(1)
    y = binornd(1, 0.5, [1 sz]);
    pos = pos + (2 * y - 1) .* step; %this step is done to get the plot centered at 0
    Y(i:i, :) = pos;
end

figure();
hold on;
plot(x, Y);
xlabel 'Time'; 
ylabel 'Position';
title 'Space-Time Curve';
hold off;