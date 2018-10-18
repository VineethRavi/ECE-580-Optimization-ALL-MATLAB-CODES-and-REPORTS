% Minimize Griewank PSO Algorithm

D=2;

x_min = -5;           % Bound Position and Velocities
x_max = 5;
v_min = -1;
v_max = 1;

N_iterations = 100;
d = 100;     % Number of Particles

% Initialization of PSO parameters ( Constriction-factor version )


c1=2.01;
c2=1.99;

best=zeros(N_iterations,1);
average=zeros(N_iterations,1);
worst=zeros(N_iterations,1);
F_best=zeros(N_iterations,1);

% Initialize the position, velocities, pbest & gbest of particles

p_pos = x_min + (x_max-x_min).*rand(d,D);
p_vel = v_min + (v_max-v_min).*rand(d,D);

p_best = p_pos;

for k=1:d
    F_best(k)=griewank(p_pos(k,:));
end

[g_best_value,g_best_index]=min(F_best);
g_best=p_pos(g_best_index,:);

% PSO Algorithm with the Constriction Factor

for k=1:N_iterations
    for i=1:d
        r=rand(1,2);
        s=rand(1,2);
        p_vel(i,:) = 0.99*p_vel(i,:) + c1*r.*(p_best(i,:)-p_pos(i,:)) + c2*s.*(g_best-p_pos(i,:));
       
        p_vel(i,:) = min(v_max,max(v_min,p_vel(i,:)));
        
        p_pos(i) = p_pos(i) + p_vel(i);
        
        if p_pos(i,1) > 5
            p_pos(i,1)=5;
        end
        if p_pos(i,1) < -5
            p_pos(i,1)=-5;
        end
        if p_pos(i,2) >5
            p_pos(i,2)=5;
        end
        if p_pos(i,2) < -5
            p_pos(i,2)=-5;
        end          
    end
    
    for i=1:d
        F_new(i)=griewank(p_pos(i,:));
        
        if F_new(i)<F_best(i)
            F_best(i)=F_new(i);
            p_best(i,:)=p_pos(i,:);
        end
    end
    
    [g_best_value,g_best_index]=min(F_best);
    g_best=p_pos(g_best_index,:);
    
    best(k)=min(F_best);
    average(k)=mean(F_best);
    worst(k)=max(F_best);
        
end

disp(g_best);
disp(g_best_value);

figure;
x=1:N_iterations;
plot(x,best,'o',x,average,'x',x,worst,'*');
hold on;
plot(x,[best average worst]);
hold off;
legend('Best','Average','Worst');
xlabel('Iterations');
ylabel('Objective Function Value');
    
    
   