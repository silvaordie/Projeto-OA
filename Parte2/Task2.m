%Correr
x0 = [-1 ; -1 ; 0];
e=10^(-6);
data = 'data2';
load(data);
[x,g]=GradientAlgorithm(x0,e,data)

%Plot
figure(1)
hold on
for i=1:150
    if Y(i)==1
        plot(X(1,i),X(2,i),'bo','LineWidth',1.5);
    else
        plot(X(1,i),X(2,i),'ro','LineWidth',1.5);
    end
end
ponto1 = [6 , ( x(3) - x(2)*6 ) / ( x(1) )];
ponto2 = [( x(3) - x(1)*6 ) / ( x(2) ) , 6];
plot( ponto1 , ponto2 , 'g--','LineWidth',1.5)
figure(2)
for i=1:length(g)
norm_g(i)=log10(norm( g(1:3,i) ));
end
plot( 1:1:length(g) , norm_g )
    
    
    