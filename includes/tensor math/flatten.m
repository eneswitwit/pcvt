function Z=flatten(X,jj)

nd=ndims(X);

if jj~=1
  X=permute(X,[jj:nd, 1:jj-1]);
end

Z=X(:,:);