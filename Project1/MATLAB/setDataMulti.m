function [X, y, data, m, theta, iter, alpha] = setDataMulti()
    % Load Data
    data = load('ex1data2.txt');
    X = data(:, 1:2);
    y = data(:, 3);
    % Print out some data points
    % First 10 examples from the dataset
    fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');
    m = length(y); % number of training examples
    theta = zeros(3, 1); % initialize fitting parameters
    iter = 400;
    alpha = 0.1;
end