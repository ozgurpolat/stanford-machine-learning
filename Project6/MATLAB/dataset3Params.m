function [C, sigma, C_list] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

C_L = [0.01 0.03 0.1 0.3 1 3 10 30];
SIGMA_L = [0.01 0.03 0.1 0.3 1 3 10 30];
C_list = zeros(1,64);
S_list = zeros(1,64);
means = zeros(1,64);
% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

for i = 1:length(C_L)
    index = i*length(C_L)-(length(C_L)-1);
    disp("i: "); disp(i);
    for j = 1:length(SIGMA_L)
        model = svmTrain(X, y, C_L(i), @(x1, x2)gaussianKernel(x1, x2, SIGMA_L(j)));
        predictions = svmPredict(model, Xval);
        mv = mean(double(predictions ~= yval));
        C_list(index+j-1) = C_L(i);
        S_list(index+j-1) = SIGMA_L(j);
        means(index+j-1) = mv;
    end
end

[M,I] = min(means);

C = C_list(I);
sigma = S_list(I);

% =========================================================================

end
