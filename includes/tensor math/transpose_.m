% Tranpose quadratic Tensors
function TENSOR_TRANSPOSED = transpose_(TENSOR,order)
    MATRIX = tensor_to_matrix(TENSOR,order);
    MATRIX_TRANSPOSED = transpose(MATRIX);
    TENSOR_TRANSPOSED = matrix_to_tensor(MATRIX_TRANSPOSED,order);
end