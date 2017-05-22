function [U_tensor,S,V_tensor] = hosvd_(TENSOR)

    % Compute singular value decomposition for the mode-k flattenings and
    % store U and V.
    for k=1:4
        TENSOR_flattened = flatten(TENSOR,k);
        [U,E,V] = svd(TENSOR_flattened);
        U_tensor(:,:,k) = U;
        V_tensor(:,:,k) = V;
    end
    
    % Compute core tensor S
    for k=1:4
        TENSOR = nmodeproduct(TENSOR,transpose(U_tensor(:,:,k)),k);
    end
    
    S = TENSOR;
    
    % Transform cell Tensor to matrix Tensor

  
end