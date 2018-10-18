% Travelling Salesman Problem using Genetic Algorithm

num_cities=20;                               % Total Number of Cities
                                             % Totallty 20! combinations
                                             % possible
x_min=0;
x_max=20;                                    % Space of generating city coordinates
y_min=-5;
y_max=15;

cities=zeros(2,num_cities);                           % Phenotype space
cities(1,:)=x_min + (x_max-x_min).*rand(1,num_cities);   % X coordinate of cities
cities(2,:)=y_min + (y_max-y_min).*rand(1,num_cities);   % Y coordinate of cities

N_population=500;                      % Population / Number of Chromosomes
N_iterations=1000;                     % Number of iterations of the genetic algorithm
N_elites=10;                           % Number of Elite Chromosones, passed to next generation
pc=0.75;                               % CrossOver probability
pm=0.0075;                             % Mutation probability

best=zeros(N_iterations); 
worst=zeros(N_iterations); 
average=zeros(N_iterations); 
x=zeros(N_population,num_cities);      % Index/Order of the cities for every chromosone
m=zeros(N_population,num_cities);      % Mating Pool
f=zeros(N_population,1);               % Fitness Computation for chromosome

for i=1:N_population                   % Initialzing the Chromosomes
    x(i,:)=randperm(num_cities);       
    f(i)=fitness(cities,x(i,:));
end

for k=1:N_iterations                      % Running 1000 iterations of the GA    
    [Sort_Values,Sort_Index]=sort(f(:),'descend');
    
    for i=1:N_elites
        m(i,:)=x(Sort_Index(i),:);         % Elitism of Chromosomes 
    end
    
    for i=(N_elites+1):N_population
        
        P_RW=cumsum(f)/sum(f);             % Roulette-Wheel Method of selecting chromosomes
        j=find((P_RW-rand())>0,1);
        m(i,:)=x(j,:);                 % Choosing fit chromosomes to mating pool
        
        if(pc>rand())                    % Applying CrossOver operator
            p=randi([1 num_cities]);           
            q=randi([1 num_cities]);
            temp=m(i,p);
            m(i,p)=m(i,q);
            m(i,q)=temp;
        end
    end
    best(k)=1/(max(f));                 % Computing Best, Worst , Average Objective Values-Distance
    worst(k)=1/(min(f));
    average(k)=1/(mean(f));
    
    x=m;                            % Next generation of Chromosomes
    for i=1:N_population
    f(i)=fitness(cities,x(i,:));       % Evaluvating fitness
    end   
end

[value,index]=max(f);                  % Choosing BestFit chromosome

Shortest_Route=x(index,:);             % Optimal Route
Shortest_Distance=1/fitness(cities,Shortest_Route);  % Optimal distance

X=cities(1,Shortest_Route);
X(num_cities+1)=cities(1,Shortest_Route(1));
Y=cities(2,Shortest_Route);
Y(num_cities+1)=cities(2,Shortest_Route(1));

disp('The Shortest Route PATH for the TSP is');
disp(Shortest_Route);
disp('The length of the optimal path traversed for the TSP is');
disp(Shortest_Distance);

plot(X,Y,'b-o');                    % Plotting the optimal path for TSP

for i=1:20
    text(X(i),Y(i),[num2str(X(i)) ',' num2str(Y(i))]);
end

xlabel('X axis');
ylabel('Y axis');
title('Plot of the optimal path for the TSP');

b=best(:,1);
a=average(:,1);
w=worst(:,1);
figure ;                                  % Plot for best,worst and average objective function Values
x=1:N_iterations;
plot(x,b,'o',x,a,'x',x,w,'*');
hold on;
plot(x,[b a w]);
hold off;
legend('Best','Average','Worst');
xlabel('Iterations');
ylabel('Objective Function Value');


