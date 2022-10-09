rng(1); %setting the seed

sz = 10.^4;
trials = 10.^3;
step = 10.^-3;
y = binornd(trials, 0.5, [1 sz]);
Y = (2 * y - trials).* step; %this step is done to get the plot centered at 0
mean = sum(Y)/length(Y);
var = sum(Y.*Y)/length(Y) - mean^2;

disp("Mean: " + mean); %displaying the results
disp("Variance: " + var);