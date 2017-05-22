function N = compute_basis_matrix_N(order,q_order)
    %vertices = equidistant_points(order);
    [nodes,weights] = int_gauss_weights(q_order,0,1);
    for i=1:q_order
        for j=1:order
            N(i,j)=eval_lagrange(i,nodes(j),nodes);
        end
    end
    
end