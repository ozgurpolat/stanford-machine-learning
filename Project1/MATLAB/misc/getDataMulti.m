function [X, y, m, data] = getDataMulti()
    % Load Data
    data = load('ex1data2.txt');
    X = data(:, 1:2);
    y = data(:, 3);
    m = length(y);
    
    % Print out some data points
    % First 10 examples from the dataset
    fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');
end