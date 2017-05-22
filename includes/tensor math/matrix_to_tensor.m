% Transform a matrix to a tensor via lexicographical order

function TENSOR = matrix_to_tensor(MATRIX,order)
    n = (order+1)*(order+1);
    for i=1:n
        for j=1:n
            [i_1,i_2] = transform_2d_(i,order);
            [j_1,j_2] = transform_2d_(j,order);
            TENSOR(i_1,i_2,j_1,j_2)= MATRIX(i,j);
        end
    end
    
end