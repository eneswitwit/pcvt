function val = eval_lagrange(i,x,vertex)
    [nodes,weights] = int_gauss_weights(4,0,1);
    val = 1;
    for j=1:size(vertex)
        if i ~= j
            val = val *  ((x - vertex(j)) / (vertex(i) - vertex(j)));
        end
    end
    
    val = val * 1/sqrt(weights(i));
end