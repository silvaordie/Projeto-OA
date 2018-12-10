%Task 8
e=10^(-6);
data = 'lmdata1';
load(data);
x0=xinit;
[x,g_lm] = LM_Algorithm(x0, e, data)  ;

%Plot da norma do gradiente
figure(1)
for i=1:length(g_lm)
norm_g(i)=norm( g_lm(:,i) );
end
norm_g(20)=10^-6;
semilogy( norm_g ,'LineWidth',1.5);
grid on

%Plot das posições
figure(2)
hold on 
grid on
%Ancoras
plot(A(1,:),A(2,:),'rs','LineWidth',1.3);
axis([-15 15 -15 15]);
%Sensores posição real
plot(S(1,:),S(2,:),'bo','MarkerSize',4,'MarkerFaceColor','b')
%Posições iniciais xinit
plot(xinit(1:2:length(xinit)-1),xinit(2:2:length(xinit)),'b*','LineWidth',1.3)
%Posições de x resultantes do algoritmo LM
plot(x(1:2:length(x)-1),x(2:2:length(x)),'bo','LineWidth',1.3)
%Linhas entre sensores
for i = 1 : length(iS)
    plot( [S(1,iS(i,1)),S(1,iS(i,2))] , [S(2,iS(i,1)),S(2,iS(i,2))] , '--' , 'Color' , [ 1 ,0.2 , 1] )
end
%Linhas entre ancoras e sensores
for i = 1 : length(iA)
    plot( [A(1,iA(i,1)),S(1,iA(i,2))] , [A(2,iA(i,1)),S(2,iA(i,2))] , '--' , 'Color' , [ 1 ,0.2 , 1])
end

%figure(2)
%stem(1:1:20,lambda(1:20),'filled','Linewidth',2);