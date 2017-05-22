function TENSOR_inverse = hosvd_inverse(S,U,order)
    % Compute singular value decomposition for the mode-k flattenings and
    % store U and V.
    S_MATRIX = tensor_to_matrix(S,order);
    S_MATRIX_INVERSE = pinv(S_MATRIX);
    S_TENSOR_INVERSE = matrix_to_tensor(S_MATRIX_INVERSE,order);
    
    % Compute core tensor S
    for k=1:4
        S_TENSOR_INVERSE = nmodeproduct(S_TENSOR_INVERSE,U(:,:,k),k);
    end
    
    TENSOR_inverse = S_TENSOR_INVERSE;
   
end