function [X, y, data, m, theta, iter, alpha] = setData()
    data = load('ex1data1.txt'); % read comma separated data
    X = data(:, 1); y = data(:, 2);
    plotData(X,y);
    
    m = length(X); % number of training examples
    X = [ones(m, 1), data(:,1)]; % Add a column of ones to x
    theta = zeros(2, 1); % initialize fitting parameters
    iter = 1500;
    alpha = 0.01;
end