%Task 1
T=81;
P_ini=[0 5];
V_ini=[0 0];
P_fin=[15 -15];
V_fin=[0 0];
w=[10 20 30 30 20 10 ; 10 10 10 0 0 -10];
tau=[10 25 30 40 50 60];
U_max=100;
E=[1 0 0 0 ; 0 1 0 0];
v_lambda=[0.001 0.01 0.1 1 10 100 1000];
A=[1 0 0.1 0 ; 0 1 0 0.1 ; 0 0 0.9 0 ; 0 0 0 0.9];
B=[0 0 ; 0 0 ; 0.1 0 ; 0 0.1];
Mean_deviation_1=[0 0 0 0 0 0 0];
Count_1=[0 0 0 0 0 0 0];

for aux=1:7
    lambda=v_lambda(aux);
    cvx_begin quiet
    variable x(T,4);
    variable u(2,T);
    
    som = (x(tau(1),1)-w(1,1))^2 +  (x(tau(1),2)-w(2,1))^2;
    
    for k=2:6
        som = (x(tau(k),1)-w(1,k))^2 +  (x(tau(k),2)-w(2,k))^2 + som;
    end
    for t=2:T
        som = som + lambda*( (u(1,t)-u(1,t-1))^2 + (u(2,t)-u(2,t-1))^2 );
    end
    
    minimize( som )
    
    x(1,:) == [P_ini V_ini];
    x(T,:) == [P_fin V_fin];
    
    for t=1:T
        ( (u(1,t))^2 + (u(2,t))^2 ) <= U_max^2;
    end
    for t=1:T-1
        x(t+1,:) == (A*x(t,:)' + B*u(:,t))';
    end
    
    cvx_end;
    
    [Mean_deviation_1(aux), Count_1(aux)] = results(lambda, x, w, u, tau);

end
Mean_deviation_1
Count_1

%%
%Task2

T=81;
P_ini=[0 5];
V_ini=[0 0];
P_fin=[15 -15];
V_fin=[0 0];
w=[10 20 30 30 20 10 ; 10 10 10 0 0 -10];
tau=[10 25 30 40 50 60];
U_max=100;
E=[1 0 0 0 ; 0 1 0 0];
v_lambda=[0.001 0.01 0.1 1 10 100 1000];
A=[1 0 0.1 0 ; 0 1 0 0.1 ; 0 0 0.9 0 ; 0 0 0 0.9];
B=[0 0 ; 0 0 ; 0.1 0 ; 0 0.1];
Mean_deviation_2=[0 0 0 0 0 0 0];
Count_2=[0 0 0 0 0 0 0];

for aux=1:7
    lambda=v_lambda(aux);
    cvx_begin quiet
    variable x(T,4);
    variable u(2,T);
    
    som = (x(tau(1),1)-w(1,1))^2 +  (x(tau(1),2)-w(2,1))^2;
    
    for k=2:6
        som = (x(tau(k),1)-w(1,k))^2 +  (x(tau(k),2)-w(2,k))^2 + som;
    end
    for t=2:T
       som = som + lambda*norm( u(:,t)-u(:,t-1) );
    end
    
    minimize( som )
    
    x(1,:) == [P_ini V_ini];
    x(T,:) == [P_fin V_fin];
    
    for t=1:T
        ( (u(1,t))^2 + (u(2,t))^2 ) <= U_max^2;
    end
    for t=1:T-1
        x(t+1,:) == (A*x(t,:)' + B*u(:,t))';
    end
    
    cvx_end;
    
    [Mean_deviation_2(aux), Count_2(aux)] = results(lambda, x, w, u, tau);

end
Mean_deviation_2
Count_2

%%
%Task 3

T=81;
P_ini=[0 5];
V_ini=[0 0];
P_fin=[15 -15];
V_fin=[0 0];
w=[10 20 30 30 20 10 ; 10 10 10 0 0 -10];
tau=[10 25 30 40 50 60];
U_max=100;
E=[1 0 0 0 ; 0 1 0 0];
v_lambda=[0.001 0.01 0.1 1 10 100 1000];
A=[1 0 0.1 0 ; 0 1 0 0.1 ; 0 0 0.9 0 ; 0 0 0 0.9];
B=[0 0 ; 0 0 ; 0.1 0 ; 0 0.1];
Mean_deviation_3=[0 0 0 0 0 0 0];
Count_3=[0 0 0 0 0 0 0];


for aux=1:7
    lambda=v_lambda(aux);
    cvx_begin quiet
    variable x(T,4);
    variable u(2,T);
    
    som = (x(tau(1),1)-w(1,1))^2 +  (x(tau(1),2)-w(2,1))^2;
    
    for k=2:6
        som = (x(tau(k),1)-w(1,k))^2 +  (x(tau(k),2)-w(2,k))^2 + som;
    end
    for t=2:T
       som = som + lambda*( abs( u(1,t)-u(1,t-1) ) + abs( u(2,t)-u(2,t-1) ) );
    end
    
    minimize( som )
    
    x(1,:) == [P_ini V_ini];
    x(T,:) == [P_fin V_fin];
    
    for t=1:T
        ( (u(1,t))^2 + (u(2,t))^2 ) <= U_max^2;
    end
    for t=1:T-1
        x(t+1,:) == (A*x(t,:)' + B*u(:,t))';
    end
    
    cvx_end;
    
    [Mean_deviation_3(aux), Count_3(aux)] = results(lambda, x, w, u, tau);
end
Mean_deviation_3
Count_3

%%
%Task 6

T=81;
P_ini=[0 5];
V_ini=[0 0];
P_fin=[15 -15];
V_fin=[0 0];
w=[10 20 30 30 20 10 ; 10 10 10 0 0 -10];
tau=[10 25 30 40 50 60];
U_max=100;
E=[1 0 0 0 ; 0 1 0 0];
v_lambda=[0.001 0.01 0.1 1 10 100 1000];
A=[1 0 0.1 0 ; 0 1 0 0.1 ; 0 0 0.9 0 ; 0 0 0 0.9];
B=[0 0 ; 0 0 ; 0.1 0 ; 0 0.1];
Mean_deviation_6=[0 0 0 0 0 0 0];
Count_6=[0 0 0 0 0 0 0];

r=2;

for aux=1:7
    lambda=v_lambda(aux);
    cvx_begin quiet
    variable x(T,4);
    variable u(2,T);
    
    %som =  power( abs(norm(x(1,1:2)-w(:,1)')-r) , 2 ) ;
    %som = ((x(tau(1),1)-w(1,1))^2 +  (x(tau(1),2)-w(2,1))^2) + r^2 + 2*norm(x(1,1:2)-w(:,1)')*r;
    som = 0;
    for k=1:6
      % som = ((x(tau(k),1)-w(1,k))^2 +  (x(tau(k),2)-w(2,k))^2) + r^2 + 2*norm(x(k,1:2)-w(:,k)')*r + som;
      som =  square_pos( square_pos(norm(x(tau(k),1:2)-w(:,k)')) - square_pos(r)) + som ;
    end
    for t=2:T
       som = som + lambda*norm( u(:,t)-u(:,t-1) );
    end
    
    minimize( som )
    
    x(1,:) == [P_ini V_ini];
    x(T,:) == [P_fin V_fin];
    
    for t=1:T
        ( (u(1,t))^2 + (u(2,t))^2 ) <= U_max^2;
    end
    for t=1:T-1
        x(t+1,:) == (A*x(t,:)' + B*u(:,t))';
    end
    
    cvx_end;
    
    [Mean_deviation_6(aux), Count_6(aux)] = results(lambda, x, w, u, tau);
    
end
Mean_deviation_6
Count_6

%%
%Task 7

T=81;
P_ini=[0 5];
V_ini=[0 0];
P_fin=[15 -15];
V_fin=[0 0];
w=[10 20 30 30 20 10 ; 10 10 10 0 0 -10];
tau=[10 25 30 40 50 60];
U_max=15;
E=[1 0 0 0 ; 0 1 0 0];
v_lambda=[0.001 0.01 0.1 1 10 100 1000];
A=[1 0 0.1 0 ; 0 1 0 0.1 ; 0 0 0.9 0 ; 0 0 0 0.9];
B=[0 0 ; 0 0 ; 0.1 0 ; 0 0.1];
Mean_deviation_7=[0 0 0 0 0 0 0];
Cont_7=[0 0 0 0 0 0 0];

r=2;
 
cvx_begin quiet
    variable x(T,4);
    variable u(2,T);
    
    x(1,:) == [P_ini V_ini];
    x(T,:) == [P_fin V_fin];
    
    for t=1:T
        ( (u(1,t))^2 + (u(2,t))^2 ) <= U_max^2;
    end
    for t=1:T-1
        x(t+1,:) ==  (A*x(t,:)' + B*u(:,t))';
    end
    for k=1:6
        x(tau(k),1) == w(1,k);
        x(tau(k),2) == w(2,k);
    end
    
cvx_end;

figure(30); clf;
subplot(1,2,1)
plot(w(1,:),w(2,:),'ro',35,15,0,-15,'MarkerSize',10); hold on;
plot(x(:,1),x(:,2),'bo','MarkerSize',3);
for k=1:6
    viscircles([w(1,k),w(2,k)],2);
end
grid on;
subplot(1,2,2)
temp=[0:80];
plot(temp,u(1,:)); hold on;
plot(temp,u(2,:));
legend('u1(t)','u2(t)')
grid on;
title('Optimal control signal u(t)')




%%
%Task 9

T=81;
P_ini=[0 5];
V_ini=[0 0];
P_fin=[15 -15];
V_fin=[0 0];
w=[10 20 30 30 20 10 ; 10 10 10 0 0 -10];
tau=[10 25 30 40 50 60];
U_max=15;
E=[1 0 0 0 ; 0 1 0 0];
v_lambda=[0.001 0.01 0.1 1 10 100 1000];
A=[1 0 0.1 0 ; 0 1 0 0.1 ; 0 0 0.9 0 ; 0 0 0 0.9];
B=[0 0 ; 0 0 ; 0.1 0 ; 0 0.1];

cvx_begin quiet
    variable x(T,4);
    variable u(2,T);
    
    som = 0;
    for k=1:6
      som =  square_pos( norm( x(tau(k), 1:2) - w(:,k)' ) )  + som ;
    end
    
    minimize( som )
    
    x(1,:) == [P_ini V_ini];
    x(T,:) == [P_fin V_fin];
    
    for t=1:T
        ( (u(1,t))^2 + (u(2,t))^2 ) <= U_max^2;
    end
    for t=1:T-1
        x(t+1,:) == (A*x(t,:)' + B*u(:,t))';
    end
    
cvx_end;
    
    %Trajeto
    figure(31);
    subplot(1,2,1)
    plot(w(1,:),w(2,:), 'rs' ,35,15,0,-15, 'MarkerSize' , 5 ); hold on;
    plot( x(:,1) , x(:,2) , 'bo' , 'MarkerSize' , 3);
    
    for k=1:6
        plot(x(tau(k),1),x(tau(k),2),'ro','MarkerSize',8);
    end
    
    legend('Pontos Intermédios','Trajeto','Instantes chave');
    xlabel('X1');
    ylabel('X2');
    title('Trajeto do robô');
    grid on;
    
    subplot(1,2,2)
    temp=0:length(u)-1;
    plot(temp,u(1,:)); 
    hold on;
    plot(temp,u(2,:));
    legend('u1(t)','u2(t)');
    xlabel('Tempo');
    ylabel('Amplitude');
    title('Sinais de controlo para');
    grid on;
   
    catches = 0;    
    for k=1:6
       if( norm( x(tau(k),1:2) - w(:,k)' )  <= 10^-6 )
          catches = catches+1; 
       end
    end
    catches
    
%%
%Task 10

T=81;
P_ini=[0 5];
V_ini=[0 0];
P_fin=[15 -15];
V_fin=[0 0];
w=[10 20 30 30 20 10 ; 10 10 10 0 0 -10];
tau=[10 25 30 40 50 60];
U_max=15;
A=[1 0 0.1 0 ; 0 1 0 0.1 ; 0 0 0.9 0 ; 0 0 0 0.9];
B=[0 0 ; 0 0 ; 0.1 0 ; 0 0.1];

cvx_begin quiet
    variable x(T,4);
    variable u(2,T);
    
    som = 0;
    for k=1:6
      som =  norm( x(tau(k), 1:2) - w(:,k)' ) + som ;
    end
    
    minimize( som )
    
    x(1,:) == [P_ini V_ini];
    x(T,:) == [P_fin V_fin];
    
    for t=1:T
        ( (u(1,t))^2 + (u(2,t))^2 ) <= U_max^2;
    end
    for t=1:T-1
        x(t+1,:) == (A*x(t,:)' + B*u(:,t))';
    end
    
    cvx_end;
    
    catches=results2(x,w,u,tau)


    %%
    %Task 11
    
    T=81;
    P_ini=[0 5];
    V_ini=[0 0];
    P_fin=[15 -15];
    V_fin=[0 0];
    w=[10 20 30 30 20 10 ; 10 10 10 0 0 -10];
    tau=[10 25 30 40 50 60];
    U_max=15;
    E=[1 0 0 0 ; 0 1 0 0];
    v_lambda=[0.001 0.01 0.1 1 10 100 1000];
    A=[1 0 0.1 0 ; 0 1 0 0.1 ; 0 0 0.9 0 ; 0 0 0 0.9];
    B=[0 0 ; 0 0 ; 0.1 0 ; 0 0.1];
    x_m = zeros(T,4);
    u_m = zeros(2,T);
    catches = zeros(10,1);
    
    for m=0:9
        cvx_begin quiet
        variable x(T,4);
        variable u(2,T);
        som=0;
        
        if ( m == 0 )
            for k=1:6
                som =  norm( x(tau(k), 1:2) - w(:,k)' ) + som ;
            end
        end
        if ( m >= 1 )
            for k=1:6
                som = ( (1/(norm( x_m(tau(k), 1:2 ) - w(:,k)' ) + 10^(-6))) * norm( x(tau(k), 1:2) - w(:,k)' ) ) + som ;
            end
        end
        minimize( som )
        
        x(1,:) == [P_ini V_ini];
        x(T,:) == [P_fin V_fin];
        
        for t=1:T
            ( (u(1,t))^2 + (u(2,t))^2 ) <= U_max^2;
        end
        for t=1:T-1
            x(t+1,:) == (A*x(t,:)' + B*u(:,t))';
        end
        
        cvx_end;
        x_m=x;
        u_m=u;
        
        catches(m+1)=results2(x,w,u,tau)
    end