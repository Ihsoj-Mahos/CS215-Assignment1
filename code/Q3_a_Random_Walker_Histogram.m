rng(1); %setting the seed

sz = 10.^4;
bins = 30;
trials = 10.^3;
step = 10.^-3;
y = binornd(trials, 0.5, [1 sz]);

Y = (2 * y - trials).* step; %this step is done to get the plot centered at 0

figure();
hold on;
histogram(Y, bins);
xlabel 'Final Position'; 
ylabel 'Frequency';
title 'Random Walker';
hold off;