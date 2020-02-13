function [coeff, score, latent]=pcaogc(X)
% De-mean
X = bsxfun(@minus,X,mean(X));
% Calculate eigenvalues and eigenvectors of the covariance matrix
covarianceMatrix = cov(X);
[V,D] = eig(covarianceMatrix);
% "coeff" are the principal component vectors. These are the eigenvectors of the covariance matrix. Compare ...
coeff=V(:,end:-1:1);
% Multiply the original data by the principal component vectors to get the projections of the original data on the
% principal component vector space. This is also the output "score". Compare ...
score = X*coeff;
% The columns of X*coeff are orthogonal to each other. This is shown with ...
% The variances of these vectors are the eigenvalues of the covariance matrix, and are also the output "latent". Compare
% these three outputs
latent=var(score)';