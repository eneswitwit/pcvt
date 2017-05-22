function V = laplacian_pinv(n)
    N_=(N(n));
    W_=(W(n));
    Wdx_=(Wdx(n));
    Ndx_=(Ndx(n));
    
    V= invi(kron(Wdx_*transpose(Ndx_), W_*transpose(N_)), transpose(kron(W_*transpose(N_),Wdx_*transpose(Ndx_))));

end