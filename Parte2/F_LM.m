function [f_lm,f_lm_j]=F_LM(x, data)
     load(data);
     %Cria a matriz A de forma a -sp=A*x
     for k1=1:length(iA)
        for k2=1:length(x)/2
            if k2 == iA(k1,2)
                A_s(k1*2-1,2*k2-1)=-1;
                A_s(k1*2,2*k2)=-1;
            else
                A_s(k1*2-1,2*k2-1)=0;
                A_s(k1*2,2*k2)=0; 
            end
        end
        b_s((2*k1-1):(2*k1),1) = A(1:2,iA(k1));
     end
     %Cria a matriz B de forma a sp-sq=B*x
     for k1=1:length(iS)
        for k2=1:length(x)/2
            if k2 == iS(k1,1)
                B_s(k1*2-1,2*k2-1)=1;
                B_s(k1*2,2*k2)=1;
            elseif k2 == iS(k1,2)
                B_s(k1*2-1,2*k2-1)=-1;
                B_s(k1*2,2*k2)=-1;
            else
                B_s(k1*2-1,2*k2-1)=0;
                B_s(k1*2,2*k2)=0; 
            end
         end
     end
     
     %Calculo do somatorio de f1
     aux_1 = 0;
     aux_2 = 0;
     for j=1:length(y)
         aux_1 = y(j)*sqrt( ( A_s(j*2-1,:)*x+b_s(j*2-1) )^2 + ( A_s(j*2,:)*x+b_s(j*2) )^2 );
         aux_2 = aux_2 + aux_1;
         %f1_j(j,1) = x'*A_s(j*2-1:2*j,:)'*A_s(j*2-1:2*j,:)*x + b_s(j*2-1:j*2)'*b_s(j*2-1:j*2) + y(j)^2 + 2*b_s(j*2-1:j*2)'*A_s(j*2-1:2*j,:)*x - 2*aux_1;
         f1_j(j,1) = sqrt( ( A_s(j*2-1,:)*x+b_s(j*2-1) )^2 + ( A_s(j*2,:)*x+b_s(j*2) )^2 ) - y(j);
     end
     som_f1 = x'*A_s'*A_s*x + b_s'*b_s + y'*y + 2*b_s'*A_s*x - 2*aux_2;
     
     %Calculo do somatorio de f2
     aux_1 = 0;
     aux_2 = 0;
     for j=1:length(z)
        aux_1 = z(j)*sqrt( (B_s(j*2-1,:)*x)^2 + (B_s(j*2,:)*x)^2 );
        aux_2 = aux_2 + aux_1;
        %f2_j(j,1) = x'*B_s(j*2-1:2*j,:)'*B_s(j*2-1:2*j,:)*x + z(j)^2 - 2*aux_1;
        f2_j(j,1) = sqrt( (B_s(j*2-1,:)*x)^2 + (B_s(j*2,:)*x)^2 ) -z(j);
     end
     som_f2 = x'*B_s'*B_s*x + z'*z - 2*aux_2;
     
     %Calculo de f
     f_lm=som_f1+som_f2;
     %Cria��o do vetor f_lm_j = �[ f1_j f2_j ]'
     f_lm_j = [ f1_j ; f2_j ];
end