%% Powell Conguate Gradient First Point

syms x y

f= 20 + (0.01)*(x.^2) +  (0.01)*(y.^2) - 10*(cos(0.2*pi*x)+cos(0.2*pi*y));

alphas=[];
betas=[];
x0=[7.5;9]; 

X=[];
l=[];
d=[];

i=2;

grad_f=gradient(f);
X(:,1)=x0;

l(:,1)=subs(grad_f,{x,y},{x0(1),x0(2)});

d(:,1)=-l(:,1);

while norm(l(:,i-1))>=0.0001
    
    alphas(i-1)=alphaFibonacci(X(:,i-1),d(:,i-1));
    
    X(:,i)=X(:,i-1)+alphas(i-1)*d(:,i-1);
    
    l(:,i)=subs(grad_f,{x,y},{X(1,i),X(2,i)});
    
    betas(i-1)=powel(0,(transpose(l(:,i))*(l(:,i)-l(:,i-1))/(transpose(l(:,i-1))*l(:,i-1))));
    
    d(:,i)=-l(:,i)+betas(i-1)*d(i-1);
    
    i=i+1;
end

N=i-1;
disp('The points obtained by Powel Conjugate Gradient Algorithm are:');
disp(X);
disp(' The number of iterations needed is ');
disp(N);
disp('The local minimum is found at X* = ');
disp(X(:,N));
disp('The value of the function at this minimum is ');
disp(double(subs(f,{x,y},{X(1,N),X(2,N)})));


%% Powell Conguate Gradient Second Point

syms x y

f= 20 + (0.01)*(x.^2) +  (0.01)*(y.^2) - 10*(cos(0.2*pi*x)+cos(0.2*pi*y));

alphas=[];
betas=[];
x0=[-7;-7.5]; 

X=[];
l=[];
d=[];

i=2;

grad_f=gradient(f);
X(:,1)=x0;

l(:,1)=subs(grad_f,{x,y},{x0(1),x0(2)});

d(:,1)=-l(:,1);

while norm(l(:,i-1))>=0.0001
    
    alphas(i-1)=alphaFibonacci(X(:,i-1),d(:,i-1));
    
    X(:,i)=X(:,i-1)+alphas(i-1)*d(:,i-1);
    
    l(:,i)=subs(grad_f,{x,y},{X(1,i),X(2,i)});
    
    betas(i-1)=powel(0,(transpose(l(:,i))*(l(:,i)-l(:,i-1))/(transpose(l(:,i-1))*l(:,i-1))));
    
    d(:,i)=-l(:,i)+betas(i-1)*d(i-1);
    
    i=i+1;
end

N=i-1;
disp('The points obtained by Powel Conjugate Gradient Algorithm are:');
disp(X);
disp(' The number of iterations needed is ');
disp(N);
disp('The local minimum is found at X* = ');
disp(X(:,N));
disp('The value of the function at this minimum is ');
disp(double(subs(f,{x,y},{X(1,N),X(2,N)})));

%% Arrows Plot
a=-15:0.1:15;
b=a;
[x,y]=meshgrid(a);

z= 20 + (0.01)*(x.^2) +  (0.01)*(y.^2) - 10*(cos(0.2*pi*x)+cos(0.2*pi*y));
%z = 3*(1-x).^2.*exp(-(y.^2) - (x+1).^2) - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) - 1/3*exp(-(x+1).^2 - y.^2) ;
figure;

contour(x,y,z,20);
xlabel('X');
ylabel('Y');
title('Contours Rastrigin');

hold on;

for i=1:N-1
    
p1 = X(:,i);                         % First Point
p2 = X(:,i+1);                         % Second Point
dp = p2-p1;                         % Difference
quiver(p1(1),p1(2),dp(1),dp(2),0);
%text(p1(1),p1(2), sprintf('(%f,%f)',p1));
%text(p2(1),p2(2), sprintf('(%f,%f)',p2));
    
end
