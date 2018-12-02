function g2=GradF2(x, data)
    
     load(data);
     ak=[ X ; -1*ones(1,length(X))];
     eak=exp(ak'*x);
     
     s1=eak./(  ( eak+ones(length(eak),1) ).^2  ) ;
     for i=1:length(s1)
        A( i , i ) = s1( i );
     end
     s = ak*A*ak';
     
     g2=s/length(X);

end