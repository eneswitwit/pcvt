function fulfilled = check_inverse

    for order=1:7
    % Compute quadrature nodes and weights
    [nodes,weights] = int_gauss_weights(order+1,0,1);

    % Compute Mass Matrix as Tensor
    MASS_TENSOR = laplace_tensor(order,weights,nodes,nodes);
    
    % Mass Matrix for Comparing Reasons
    MASS_MATRIX = tensor_to_matrix(MASS_TENSOR,order);
    
    % Compute Pseudo Inverse with SVD
    MASS_MATRIX_INVERSE = pinv(MASS_MATRIX);
    
    % HOSVD
    [U,S,V] = hosvd_(MASS_TENSOR);

    % Compute Pseudoinverse
    MASS_INV = hosvd_inverse(S,U,order);
    
    % Transform to Matrix
    MASS_INV_MATRIX = tensor_to_matrix(MASS_INV,order);
    
    if( abs(MASS_MATRIX_INVERSE-MASS_INV_MATRIX)<0.0000001 )
        fulfilled(order)=1;
    else
        fulfilled(order)=0;
    end
    
    end

end