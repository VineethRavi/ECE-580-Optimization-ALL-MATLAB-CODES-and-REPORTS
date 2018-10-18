%% Steepest Descent First Point

syms x y

f = 3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) - 1/3*exp(-(x+1).^2 - y.^2) ;

alphas = [];
x0=[1;0];  

X=[];
i=2;

grad_f=gradient(f);
X(:,1)=x0;

l=subs(grad_f,{x,y},{x0(1),x0(2)});

while norm(l)>=0.0001
  alphas=computealpha(X(:,i-1));
  disp(alphas);
  X(:,i)=X(:,i-1)-(alphas)*l;
  l=subs(grad_f,{x,y},{X(1,i),X(2,i)});
  i=i+1;
end
N=i-1;

disp('The points obtained by steepest descent method are:');
disp(X);
disp(' The number of iterations needed is ');
disp(N);
disp('The local minimum is found at X* = ');
disp(X(:,N));
disp('The value of the function at this minimum is ');
disp(double(subs(f,{x,y},{X(1,N),X(2,N)})));


%% Steepest Descent Second Point

syms x y

f = 3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) - 1/3*exp(-(x+1).^2 - y.^2) ;

alphas = [];
x0=[-1;0];  

X=[];
i=2;

grad_f=gradient(f);
X(:,1)=x0;

l=subs(grad_f,{x,y},{x0(1),x0(2)});

while norm(l)>=0.0001
  alphas=computealpha(X(:,i-1));
  X(:,i)=X(:,i-1)-(alphas)*l;
  l=subs(grad_f,{x,y},{X(1,i),X(2,i)});
  i=i+1;
end
N=i-1;

disp('The points obtained by steepest descent method are:');
disp(X);
disp(' The number of iterations needed is ');
disp(N);
disp('The local minimum is found at X* = ');
disp(X(:,N));
disp('The value of the function at this minimum is ');
disp(double(subs(f,{x,y},{X(1,N),X(2,N)})));

