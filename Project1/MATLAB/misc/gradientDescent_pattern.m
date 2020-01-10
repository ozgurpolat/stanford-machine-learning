function [theta, J_history] = gradientDescent_pattern(X, y, theta, alpha, iter)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(iter, 1);

Hxy  = 0;
Hxyx = 0;    

for iter = 1:iter

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %


    for i = 1:m
        Hxy  = Hxy  + ((( theta(1) * X(i, 1) + theta(2) * X(i, 2)) - y(i)) * X(i, 1));
        Hxyx = Hxyx + ((( theta(1) * X(i, 1) + theta(2) * X(i, 2)) - y(i)) * X(i, 2));
    end

    
    temp1 = theta(1) - ((alpha/m) * Hxy);
    temp2 = theta(2) - ((alpha/m) * Hxyx);
    
    theta(1) =  temp1;
    theta(2) =  temp2;
    
    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
    % disp('J_hist'); disp(J_history(iter));
end

end
