function V = vmult_mass_inverse(U,order,q_order)
    N = compute_basis_matrix_N(order,q_order);
    W = compute_basis_matrix_W(order,q_order);
    N=pinv(N);
    W=pinv(W);
    V = W*transpose(N)*U*transpose(W*transpose(N));
end