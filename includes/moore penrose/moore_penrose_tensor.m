function TENSOR_INVERSE = moore_penrose_tensor(TENSOR,order)

    MATRIX = tensor_to_matrix(TENSOR,order);
    MATRIX_PSEUDOINVERSE = pinv(MATRIX);
    
    TENSOR_INVERSE = matrix_to_tensor(MATRIX_PSEUDOINVERSE,order);

end