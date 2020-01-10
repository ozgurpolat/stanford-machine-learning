function [X, y, num_labels, lambda, all_theta] = setData()
    
    load('ex3data1.mat', 'X', 'y');
    
    num_labels = 10;
    
    lambda = 0.1;
    
    [all_theta] = oneVsAll(X, y, num_labels, lambda);

end
