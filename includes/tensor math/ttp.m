function TENSOR_PRODUCT = ttp(TENSOR_1, TENSOR_2)
   n = size(TENSOR_1);
   order = n(1)-1;
   count_2d_func = n(1)*n(1);
   for i=1:count_2d_func
       for k=1:count_2d_func
           [i_1,i_2]=transform_2d_(i,order);
           [k_1,k_2]=transform_2d_(k,order);
           TENSOR_PRODUCT(i_1,i_2,k_1,k_2) = 0;
           for j=1:count_2d_func
               [j_1,j_2]=transform_2d_(j,order);
               TENSOR_PRODUCT(i_1,i_2,k_1,k_2) =  TENSOR_PRODUCT(i_1,i_2,k_1,k_2) + TENSOR_1(i_1,i_2,j_1,j_2)*TENSOR_2(j_1,j_2,k_1,k_2);
           end
       end
   end

end