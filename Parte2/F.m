function f=F(x, data)
    
     load(data);
     ak=[ X ; -1*ones(1,length(X))];
     eak=exp(ak'*x);
     
     p1=log(ones(size(eak)) + eak);
     p2=Y'.*eak;
     
     s=sum(p1-p2);
     
     f=(s/length(X));

end