function g_lm=GradF_LM(x, data)
    
     load(data);
     %Cria a matriz A de forma a -sp=A*x
     for k1=1:length(iA)
        for k2=1:length(x)-1
            if k2 == 2*iA(k1,2)-1
                A_s(k1*2-1,k2)=-1;
                A_s(k1*2,k2+1)=-1;
            else
                A_s(k1*2-1,k2)=0;
                A_s(k1*2,k2+1)=0; 
            end
        end
        b_s((2*k1-1):(2*k1),1) = A(1:2,iA(k1));
     end
     %Cria a matriz B de forma a sp-sq=B*x
     for k1=1:length(iS)
        for k2=1:length(x)-1
            if k2 == 2*iS(k1,1)-1
                B_s(k1*2-1,k2)=1;
                B_s(k1*2,k2+1)=1;
            elseif k2 == 2*iS(k1,2)
                B_s(k1*2-1,k2)=-1;
                B_s(k1*2,k2+1)=-1;
            else
                B_s(k1*2-1,k2)=0;
                B_s(k1*2,k2+1)=0; 
            end
         end
     end
     
     %Calculo do gradiente de f1
     aux=0;
     for j=1:length(y)
         aux = aux + ( (y(j)/sqrt( ( A_s(j*2-1,:)*x+b_s(j*2-1) )^2 + ( A_s(j*2,:)*x+b_s(j*2) )^2 )) * ( A_s(j*2-1:j*2,:)'*A_s(j*2-1:j*2,:)*x + A_s(j*2-1:j*2,:)'*b_s(j*2-1:j*2) ) );
     end
     grad_f1 = 2*A_s'*A_s*x + 2*A_s'*b_s - 2*aux;
     
     %Calculo do gradiente de f2
     aux=0;
     for j=1:length(z)
         aux = aux + ( (z(j)/sqrt( ( B_s(j*2-1,:)*x )^2 + ( B_s(j*2,:)*x )^2 )) * ( B_s(j*2-1:j*2,:)'*B_s(j*2-1:j*2,:)*x ) );
     end
     grad_f2 = 2*B_s'*B_s*x - 2*aux;
     
     %Calculo do gradiente de f
     g_lm = grad_f1 + grad_f2;
end