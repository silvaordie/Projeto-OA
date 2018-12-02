%Correr data1.m
x0 = [-1 ; -1 ; 0];
e=10^(-6);
data = 'data1';
load(data);
[x,g,a]=NewtonAlgorithm(x0,e,data);
norm_g=0;

%Plot data1.m
figure(1)
for i=1:length(g)
norm_g(i)=norm( g(1:3,i) );
end
semilogy( 1:1:length(g) , norm_g ,'LineWidth',1.5);
grid on

figure(2)
stem(1:1:length(a),a(:),'filled','Linewidth',2);

%%
%Correr data2.m
x0 = [-1 ; -1 ; 0];
e=10^(-6);
data = 'data2';
load(data);
[x,g,a]=NewtonAlgorithm(x0,e,data);
norm_g=0;

%Plot data2.m
figure(3)
for i=1:length(g)
norm_g(i)=norm( g(1:3,i) );
end
semilogy( 1:1:length(g) , norm_g ,'LineWidth',1.5);
grid on

figure(4)
stem(1:1:length(a),a(:),'filled','Linewidth',2);

%%
%Correr data3.m
x0 = [ -1*ones(1,30) , 0 ]';
e=10^(-6);
data = 'data3';
load(data);
[x,g,a]=NewtonAlgorithm(x0,e,data);
norm_g=0;

%Plot data3.m
figure(5)
for i=1:12
norm_g(i)=norm( g(1:31,i) );
end
semilogy( 1:12 , norm_g ,'LineWidth',1.5);
grid on

figure(6)
stem(1:1:length(a),a(:),'filled','Linewidth',2);
