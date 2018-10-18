% The fitness function for the genetic algorithm

function [result]=fitness(cities,index)

num_cities=20;                   % Total Number of cities

result=norm(cities(:,index(1))-cities(:,index(num_cities)));  

for i=2:num_cities                % Computing the Distance between consecutive Points
    result=result+norm(cities(:,index(i))-cities(:,index(i-1)));  
end

result=1/result;                 % fitness function is the inverse of the total distance 

end