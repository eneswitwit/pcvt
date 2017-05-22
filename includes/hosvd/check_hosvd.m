% Check if the HOSVD spitts out the correct result

function fulfilled = check_hosvd(TENSOR,S,U)
    n = size(U);
    size_ = n(3);
    TENSOR_RECREATED = S;
    for k=1:size_
        TENSOR_RECREATED = nmodeproduct(TENSOR_RECREATED,U(:,:,k),k);
    end
    TENSOR_RECREATED = nmodeproduct(TENSOR_RECREATED,eye(4),4);

    if ( abs(TENSOR_RECREATED-TENSOR) < 0.0000001 ) 
        fulfilled=1;
    else
        fulfilled=0;
    end
    
end