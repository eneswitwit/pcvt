function fulfilled = test_hosvd

for order=1:5
    % Compute quadrature nodes and weights
    [nodes,weights] = int_gauss_weights(order+1,0,1);
    
    % Compute Mass Matrix as Tensor
    MASS_TENSOR = laplace_tensor(order,weights,nodes,nodes);
    
    % HOSVD
    [U,S_,V] = hosvd_(MASS_TENSOR);
    S = hosvd(MASS_TENSOR);
    if( abs(S_ - S) < 0.0000000001 )
        if ( check_hosvd(MASS_TENSOR,S_,U) )
            fulfilled(order)=1;
        else
            fulfilled(order)=0;
        end
    else
        fulfilled(order)=0;
        
    end
end

end