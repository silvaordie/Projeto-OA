function count=results2( x , w , u , tau )
    
    T=81;
    count=0;
    
    %Trajeto
    figure;
    subplot(1,2,1)
    plot(w(1,:),w(2,:), 'rs' ,35,15,0,-15, 'MarkerSize' , 5 ); hold on;
    plot( x(:,1) , x(:,2) , 'bo' , 'MarkerSize' , 3);
    
    for k=1:6
        plot(x(tau(k),1),x(tau(k),2),'ro','MarkerSize',8);
    end
    
    legend('Pontos Interm�dios','Trajeto','Instantes chave');
    xlabel('X1');
    ylabel('X2');
    title('Trajeto do rob�');
    grid on;
    
    subplot(1,2,2)
    temp=0:length(u)-1;
    plot(temp,u(1,:)); 
    hold on;
    plot(temp,u(2,:));
    legend('u1(t)','u2(t)');
    xlabel('Tempo');
    ylabel('Amplitude');
    title('Sinais de controlo');
    grid on;
   
    count = 0;    
    for k=1:6
       if( norm( x(tau(k),1:2) - w(:,k)' )  <= 10^-6 )
          count = count+1; 
       end
    end
end