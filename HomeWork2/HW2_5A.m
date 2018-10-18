%% Gradient Descent First Point
syms x y

f = 3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) - 1/3*exp(-(x+1).^2 - y.^2) ;

alpha = 0.02;
x0=[1;0];

X=[];
i=2;

grad_f=gradient(f);
X(:,1)=x0;

l=subs(grad_f,{x,y},{x0(1),x0(2)});

while norm(l)>=0.0001
  X(:,i)=X(:,i-1)-(alpha)*l;
  l=subs(grad_f,{x,y},{X(1,i),X(2,i)});
  i=i+1;
end
N=i-1;
disp('The points obtained by gradient descent method are:');
disp(X);
disp(' The number of iterations needed is ');
disp(N);
disp('The local minimum is found at X* = ');
disp(X(:,N));
disp('The value of the function at this minimum is ');
disp(double(subs(f,{x,y},{X(1,N),X(2,N)})));


%% Gradient Descent Second Point
syms x y

f = 3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) - 1/3*exp(-(x+1).^2 - y.^2) ;

alpha = 0.02;
x0=[-1;0];

X=[];
i=2;

grad_f=gradient(f);
X(:,1)=x0;

l=subs(grad_f,{x,y},{x0(1),x0(2)});

while norm(l)>=0.0001
  X(:,i)=X(:,i-1)-(alpha)*l;
  l=subs(grad_f,{x,y},{X(1,i),X(2,i)});
  i=i+1;
end
N=i-1;
disp('The points obtained by gradient descent method are:');
disp(X);
disp(' The number of iterations needed is ');
disp(N);
disp('The local minimum is found at X* = ');
disp(X(:,N));
disp('The value of the function at this minimum is ');
disp(double(subs(f,{x,y},{X(1,N),X(2,N)})));


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

for i=1:N-1
    
p1 = X(:,i);                         % First Point
p2 = X(:,i+1);                         % Second Point
dp = p2-p1;                         % Difference
quiver(p1(1),p1(2),dp(1),dp(2),0);
%text(p1(1),p1(2), sprintf('(%f,%f)',p1));
%text(p2(1),p2(2), sprintf('(%f,%f)',p2));
    
end
