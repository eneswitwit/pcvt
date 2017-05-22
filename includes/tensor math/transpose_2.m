% Transpose U and V from [U,S,V]=hosvd_(MASS_MATRIX);

function TENSOR_TRANSPOSED = transpose_2(TENSOR,order)
    n = size(TENSOR);
    k = n(3);
    for i=1:k
        TENSOR_TRANSPOSED(:,:,k)=transpose(TENSOR(:,:,k));
    end
    
end