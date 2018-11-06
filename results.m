function [deviation, count]=results(lambda, x, w, u, tau )
    
    T=81;
    deviation=0;
    count=0;
    
    %Trajeto
    figure;
    subplot(1,2,1)
    plot(w(1,:),w(2,:),'ro',35,35,-15,-15,'MarkerSize',30); hold on;
    plot(x(:,1),x(:,2),'bo','MarkerSize',3);
    for k=1:6
        plot(x(tau(k),1),x(tau(k),2),'ro','MarkerSize',8);
    end
    legend('Pontos Intermédios','Trajeto','Instantes de chave');
    xlabel('X1');
    ylabel('X2');
    title(['Trajeto do robô para lambda=', num2str(lambda)]);
    grid on;
    
    
    %Controlo
    subplot(1,2,2)
    temp=0:length(u)-1;
    plot(temp,u(1,:)); 
    hold on;
    plot(temp,u(2,:));
    legend('u1(t)','u2(t)');
    xlabel('Tempo');
    ylabel('Amplitude');
    title(['Sinais de controlo para lambda=', num2str(lambda)]);
    grid on;

    
    
    for k=1:6
        deviation = ( (x(tau(k),1)-w(1,k))^2 +  (x(tau(k),2)-w(2,k))^2 )^(1/2) +  deviation;
    end
    deviation = deviation/6;
    
    for k=2:81
       if( abs(u(k)-u(k-1)) > 10^-6 )
          count = count+1; 
       end
    end
end