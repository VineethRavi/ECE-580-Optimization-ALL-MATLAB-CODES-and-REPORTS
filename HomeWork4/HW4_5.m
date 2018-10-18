% Minimize Griewank PSO Algorithm

D=2;                  % Dimension of Griewank Function

x_min = -5;           % Bound Position and Velocities
x_max = 5;
v_min = -1;
v_max = 1;

N_iterations = 50;               %Number of iterations
d = 100;                          % Number of Particles

% Initialization of PSO parameters ( Constriction-factor version )

K=0.729;
c1=2;
c2=2.1;

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

[g_best_value,g_best_index]=max(F_best);
g_best=p_pos(g_best_index,:);

% PSO Algorithm with the Constriction Factor

for k=1:N_iterations
    for i=1:d
        r=rand(1,2);
        s=rand(1,2);
        p_vel(i,:) = 0.729*(p_vel(i,:) + c1*r.*(p_best(i,:)-p_pos(i,:)) + c2*s.*(g_best-p_pos(i,:)));
       
        p_vel(i,:) = min(v_max,max(v_min,p_vel(i,:)));   % Clamp Velocities
        
        p_pos(i) = p_pos(i) + p_vel(i);              % Updating Positions of PS
        
        if p_pos(i,1) > 5                          % Restrict Positions
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
    
    for i=1:d                                    % Compute pbest & gbest
        F_new(i)=griewank(p_pos(i,:));           % Computing Function Values using p_best population
        
        if F_new(i)>F_best(i)
            F_best(i)=F_new(i);
            p_best(i,:)=p_pos(i,:);
        end
    end
    
    [g_best_value,g_best_index]=max(F_best);
    g_best=p_pos(g_best_index,:);               % Compute g_best
    
    best(k)=max(F_best);                   % Compute best,worst and average objective function values
    average(k)=mean(F_best);                      % Every Iteration
    worst(k)=min(F_best);
        
end

disp('The Maximizer Point is');
disp(g_best);                            % Plot the Maximum Point
disp('The Objective function value at the Maximum Point is');
disp(g_best_value);

figure;                                  % Plot Values 
x=1:N_iterations;
plot(x,best,'o',x,average,'x',x,worst,'*');
hold on;
plot(x,[best average worst]);
hold off;
legend('Best','Average','Worst');
xlabel('Iterations');
ylabel('Objective Function Value');
    
    
   