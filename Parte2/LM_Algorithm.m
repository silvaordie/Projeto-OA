function [x,g_lm]=LM_Algorithm(x0, e, data)   
    x=x0;
    [g_lm(1:length(x0),1),g_lm_j] = GradF_LM(x,data);
    [f_lm,f_lm_j] = F_LM(x,data);
    k=1;
    lambda(1) = 1;
    I = eye(length(x));
    while(norm( g_lm(1:length(x0),k) ) > e) 
        
       A_p = [ g_lm_j ; sqrt(lambda(k))*I ];
       b_p = [ g_lm_j*x-f_lm_j ; sqrt(lambda(k))*x ];
       
       x_teste = (A_p'*A_p)^(-1)*A_p'*b_p;
       
       [f_teste,f_lm_j_teste] = F_LM(x_teste,data);
       
       if f_teste < f_lm
            x = x_teste;
            lambda(k+1) = 0.7*lambda(k);
       else
            lambda(k+1) = 2*lambda(k);
       end
       k=k+1;
       [g_lm(1:length(x0),k),g_lm_j] = GradF_LM(x,data);
       [f_lm,f_lm_j] = F_LM(x,data);
    end
end