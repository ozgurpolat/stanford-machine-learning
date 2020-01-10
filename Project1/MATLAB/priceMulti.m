function [price, J_history] = priceMulti(X_norm, y, theta, alpha, iter)

    [theta, J_history] = gradientDescentMulti(X_norm, y, theta, alpha, iter);
    
    % Display gradient descent's result
    fprintf('Theta computed from gradient descent:\n%f\n%f',theta(1),theta(2))
    
    % Estimate the price of a 1650 sq-ft, 3 br house. You can use the same
    % code you entered ealier to predict the price
    % ====================== YOUR CODE HERE ======================
    
    % Below is a normalized price from [1, 1650, 3] 
    price = [1, -0.4413, -0.2237] * theta; % Enter your price formula here
    
    % ============================================================
    
    fprintf('Predicted price of a 1650 sq-ft, 3 br house (using gradient descent):\n $%f', price);
    
end