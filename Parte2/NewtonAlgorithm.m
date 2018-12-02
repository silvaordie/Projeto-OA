function [x,g,a]=NewtonAlgorithm(x0, e, data)   
    g(1:length(x0),1)=GradF(x0,data);
    g2(1:length(x0),1:length(x0))=GradF2(x0,data);
    x=x0;
    k=1;
    a=1;
    aux=sym('d',[length(x0),1]);
    while(norm( g(1:length(x0),k) ) > e) 
       % Resolve o sistema linear para determinar o dk, e converte o resultado do solve em doubles;
       eqn = [ g2*aux==-g(1:length(x0),k) ];
       sol = solve( eqn , aux );
       AUX = struct2cell(sol);
       d = double(cat(1,AUX{:}));
       % Aplica o Backtracking e atualiza as variaveis necess�rias 
       a(k)=Backtracking(x,d,data);
       x=x+d*a(k);
       k=k+1;
       g(1:length(x0),k)=GradF(x,data);
       g2(1:length(x0),1:length(x0))=GradF2(x,data);
    end
end