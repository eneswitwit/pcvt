function TENSOR_inverse = hosvd_inverse(S,U,order)
    % Compute singular value decomposition for the mode-k flattenings and
    % store U and V.
    n = size(S);
    for i1=1:n(1)
        for i2=1:n(2)
            for i3=1:n(3)
                for i4=1:n(4)
                    if( abs(S(i1,i2,i3,i4)) > 0.00001 )
                        S_TENSOR_INVERSE(i1,i2,i3,i4) = 1/S(i1,i2,i3,i4);
                    else
                        S_TENSOR_INVERSE(i1,i2,i3,i4) = 0;
                    end
                   
                end
            end
        end
    end
    
    % Compute core tensor S
    for k=1:4
        S_TENSOR_INVERSE = nmodeproduct(S_TENSOR_INVERSE,U(:,:,k),k);
    end
    
    TENSOR_inverse = S_TENSOR_INVERSE;
   
end