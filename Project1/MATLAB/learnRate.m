function [J_history] = learnRate(X_norm, y, theta)
    % Run gradient descent:
    % Choose some alpha value
    alpha = 0.1;
    num_iters = 50;
    
    % Init Theta and Run Gradient Descent 

    [~, J_history] = gradientDescentMulti(X_norm, y, theta, alpha, num_iters);
    
    % Plot the convergence graph
    plot(1:num_iters, J_history, '-g', 'LineWidth', 2);
    xlabel('Number of iterations');
    ylabel('Cost J');
end