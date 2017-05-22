function INVI = invi(G,H)
    INVI = pinv(G)- (1/(1+trace(H*pinv(G))))*pinv(G)*H*pinv(G);
end