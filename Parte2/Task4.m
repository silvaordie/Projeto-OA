%Correr
x0 = [ -1*ones(1,30) , 0 ]';
e=10^(-6);
data = 'data3';
load(data);
[x,g]=GradientAlgorithm(x0,e,data);
norm_g=0;

%Plot
figure(1)
for i=1:length(g)
norm_g(i)=norm( g(1:length(x0),i) );
end
semilogy( 1:1:length(g) , norm_g ,'LineWidth',1.5);
grid on