function V = vmult_mass(U,order,q_order)
    N = compute_basis_matrix_N(order,q_order);
    W = compute_basis_matrix_W(order,q_order);
    V = W*transpose(N)*U*transpose(W*transpose(N));
end