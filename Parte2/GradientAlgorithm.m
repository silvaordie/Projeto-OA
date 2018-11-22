function x=GradientAlgorithm(x0, e, data)    
    g=GradF(x0,data);
    x=x0;
    a=1;
    while(norm(g) > e)  
       d=-g;
       %a=Backtracking(x,d,data)
       x=x+d*a;
       g=GradF(x,data);
    end
end