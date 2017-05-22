function fulfilled = test(order)
    % Include necessary libraries and include files
    addpath(genpath([pwd '/includes']));
    addpath(genpath([pwd '/lib']));
    
    % Compute quadrature nodes and weights
    [nodes,weights] = int_gauss_weights(order+1,0,1);

    % Compute Mass Matrix as Tensor
    MASS_TENSOR = laplace_tensor(order,weights,nodes,nodes);
    
    % HOSVD
    [U,S,V] = hosvd_(MASS_TENSOR);
    n = size(S);
    for i1=1:n(1)
        for i2=1:n(2)
            for i3=1:n(3)
                for i4=1:n(4)
                    if( abs(S(i1,i2,i3,i4)) < 0.0000000001 )
                        S(i1,i2,i3,i4) = 0;
                    end
                end
            end
        end
    end
    
    % Compute Pseudoinverse
    MASS_INV = hosvd_inverse(S,U,order);

    % Check correctness
    fulfilled = moore_properties_tensor(MASS_TENSOR,MASS_INV,order);




end