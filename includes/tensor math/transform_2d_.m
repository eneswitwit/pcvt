function [i_1,i_2] = transform_2d_(i,order)
    n = int32(order+1);
    i_1 = idivide(i,n,'ceil');
    i_2 = i-(i_1-1)*n;
end