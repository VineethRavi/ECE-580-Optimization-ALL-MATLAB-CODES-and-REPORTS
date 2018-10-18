%% Plot of the arrows
% Before Running this CODE : 
% Run Any 1 of Gradient Descent or the Steepest Descent algorithm codes,
% for computing X(all points) and N(total points), to plot the points on contour with arrows
a=-3:0.1:3;
b=a;
[x,y]=meshgrid(a);
    
z = 3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) - 1/3*exp(-(x+1).^2 - y.^2) ;

figure;

contour(x,y,z,20);
xlabel('X');
ylabel('Y');
title('Contours Peaks');

hold on;

i=1;
j=ceil(N/3);
k=ceil(2*N/3);
m=N;

p1 = X(:,i);                         % First Point
p2 = X(:,j);                         % Second Point
dp = p2-p1;                         % Difference
quiver(p1(1),p1(2),dp(1),dp(2),0);
text(p1(1),p1(2), sprintf('(%f,%f)',p1));
text(p2(1),p2(2), sprintf('(%f,%f)',p2));



p1 = X(:,j);                         % First Point
p2 = X(:,k);                         % Second Point
dp = p2-p1;                         % Difference
quiver(p1(1),p1(2),dp(1),dp(2),0);
text(p1(1),p1(2), sprintf('(%f,%f)',p1));
text(p2(1),p2(2), sprintf('(%f,%f)',p2));


p1 = X(:,k);                         % First Point
p2 = X(:,m);                         % Second Point
dp = p2-p1;                         % Difference
quiver(p1(1),p1(2),dp(1),dp(2),0);
text(p1(1),p1(2), sprintf('(%f,%f)',p1));
text(p2(1),p2(2), sprintf('(%f,%f)',p2));



   