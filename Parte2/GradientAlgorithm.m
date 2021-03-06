function [x,g]=GradientAlgorithm(x0, e, data)   
    g(1:length(x0),1)=GradF(x0,data);
    x=x0;
    k=1;
    a=1;
    while(norm( g(1:length(x0),k) ) > e)  
       d=-g(1:length(x0),k);
       a=Backtracking(x,d,data);
       x=x+d*a;
       k=k+1;
       g(1:length(x0),k)=GradF(x,data);
    end
end