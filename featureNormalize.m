function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));
count = size(X,2);

mu = mean(X); %mu contains mean of columns of X. (vector of mean values)

X_norm = bsxfun(@minus, X, mu);

sigma = std(X_norm);
X_norm = bsxfun(@rdivide, X_norm, sigma);

#{
'bsxfun' is a built-in function from the file libinterp/corefcn/bsxfun.cc
-- bsxfun (fun, A, B)
applies the element-wise binary operation specified by the function handle fun 
to arrays A and B.

The binary singleton expansion function performs broadcasting, that is, it 
applies a binary function f element-by-element to two array arguments A and B, 
and expands as necessary singleton dimensions in either input argument.

f is a function handle, inline function, or string containing the name of the 
function to evaluate. The function f must be capable of accepting two 
  column-vector arguments of equal length, or one column vector argument and a 
  scalar.

The dimensions of A and B must be equal or singleton. The singleton dimensions 
of the arrays will be expanded to the same dimensionality as the other array.
#}


#{
for i = 1:count
  
    X_norm(:,i) = X_norm(:,i) - mu(i); 

    sigma(i) = std(X_norm(:,i));

    X_norm(:,i) = X_norm(:,i) / sigma(i);

end
#}

% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the 
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma. 
%
%               Note that X is a matrix where each column is a 
%               feature and each row is an example. You need 
%               to perform the normalization separately for 
%               each feature. 
%
% Hint: You might find the 'mean' and 'std' functions useful.
%       










end
