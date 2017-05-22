function [fulfilled,order] = structure
   for order=2:15
   % Compute quadrature nodes and weights
    [nodes,weights] = int_gauss_weights(order+1,0,1);

    % Compute Mass Matrix as Tensor
    MASS_TENSOR = laplace_tensor(order,weights,nodes,nodes);
        
    % HOSVD
    [U,S,V] = hosvd_(MASS_TENSOR);
    
    % Set Entry 0 if to small.
    n = size(S);
    for i1=1:n(1)
        for i2=1:n(2)
            for i3=1:n(3)
                for i4=1:n(4)
                    if( abs(S(i1,i2,i3,i4)) < 0.0000001 )
                        S(i1,i2,i3,i4) = 0;
                    end
                end
            end
        end
    end
    
    
    % Compute Pseudoinverse
    MASS_INV = hosvd_inverse_eff(S,U,order);
    
    
    
    % Check if it is still an inverse
    moore(order) = moore_properties_tensor(MASS_TENSOR,MASS_INV,order);
    
    % Check if computed inverse through HOSVD is equal to the pseudo inverse of mass
    % matrix with SVD
    MASS_MATRIX = tensor_to_matrix(MASS_TENSOR,order);
    MASS_MATRIX_PINV_1 = tensor_to_matrix(MASS_INV,order);
    MASS_MATRIX_PINV_2 = pinv(MASS_MATRIX);
    
    fulfilled = (abs( MASS_MATRIX_PINV_1 - MASS_MATRIX_PINV_2 ) < 0.00000000001);
    if(moore(order) == 0 )
        %break
    end
    
   end
   
   


end

