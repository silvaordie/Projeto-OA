function a=Backtracking(x,d, data)

    a=1;
    y=10^-6;
    B=0.5;
    
    while ( (F( (x+a*d) , data ) ) > (F(x,data) + y*GradF(x,data)'*(a*d)) )
        a=B*a;
    end

end