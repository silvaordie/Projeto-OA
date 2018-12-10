%Task 9
%Para esta task estou a fazer 10 inicializações random para o problema,
%e estou a representar as posições e o andamento da norma do gradiente de
%todas essas inicializações

for I=1:10
    g_lm=0;
    norm_g=0;
    e=10^(-6);
    data = 'lmdata2';
    load(data);
    %x0=[1;1;8;1;7;1;6;1;1;5;1;4;1;3;1;2];
    for i=1:16
        aux=rand;
        if aux <= 0.5
            x0(i)=rand*20;
        else
            x0(i)=-rand*20;
        end
    end
    [x,g_lm] = LM_Algorithm(x0, e, data)  ;
    
    %Plot da norma do gradiente
    figure(1)
    for i=1:length(g_lm(1,:))
        norm_g(i)=norm( g_lm(:,i) );
    end
    semilogy( norm_g ,'LineWidth',1.5);
    hold on
    grid on
    
    %Plot das posições
    figure(2)
    hold on
    %Ancoras
    plot(A(1,:),A(2,:),'rs','LineWidth',1.3);
    axis([-15 15 -15 15]);
    %Posições iniciais xinit
    plot(x0(1:2:length(x0)-1),x0(2:2:length(x0)),'b*','LineWidth',1.3)
    %Posições de x resultantes do algoritmo LM
    plot(x(1:2:length(x)-1),x(2:2:length(x)),'bo','LineWidth',1.3)
    grid on
    hold on
    
    
    F_LM(x,data)
end