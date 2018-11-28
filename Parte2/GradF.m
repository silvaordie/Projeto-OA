function g=GradF(x, data)
    
     load(data);
     ak=[ X ; -1*ones(1,length(X))];
     eak=exp(ak'*x);
     
     s1=eak./( eak+ones(length(eak),1) ) ;
     s2=s1-Y';
     A=s2;
     for i=2:length(x)
        A(:,i) = s2;
     end
     s=sum(ak'.*A);
     
     g=(s/length(X))';

end