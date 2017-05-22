function W = compute_basis_matrix_W(order,q_order)
[nodes,weights] = int_gauss_weights(q_order,0,1);
for i=1:q_order
    for j=1:order
        W(i,j)= weights(i)*eval_lagrange(i,nodes(j),nodes);
    end
end

end