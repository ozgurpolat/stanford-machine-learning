function [X, y, theta, data] = setDataNormal()
    % Solve with normal equations:
    % Load Data
    data = csvread('ex1data2.txt');
    X = data(:, 1:2);
    y = data(:, 3);
    m = length(y);
    
    % Add intercept term to X
    X = [ones(m, 1), X];
    
    % Calculate the parameters from the normal equation
    theta = normalEqn(X, y);
    
    % Display normal equation's result
    fprintf('Theta computed from the normal equations:\n%f\n%f', theta(1),theta(2));
end