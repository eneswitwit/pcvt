function V = laplacian(n)
    N_=N(n);
    W_=W(n);
    Wdx_=Wdx(3);
    Ndx_=Ndx(3);
    
    V= kron(Wdx_*transpose(Ndx_), W_*transpose(N_))+ transpose(kron(W_*transpose(N_),Wdx_*transpose(Ndx_)))

end