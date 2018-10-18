syms x y

%f = 3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) - 1/3*exp(-(x+1).^2 - y.^2) ;

f=2*(x.^2)+(x.*y)+(3*y.^2);

%x0=[1;0];
x0=[0.8;-0.25];
syms alpha

grad_f=gradient(f);
l=subs(grad_f,{x,y},{x0(1),x0(2)});

xalpha=x0-alpha*l;

falpha=subs(f,{x,y},{xalpha(1),xalpha(2)});

al=[];

al(1)=0;

for i=2:10000
    
    df=diff(falpha,alpha);
    ddf=diff(df,alpha);
    dfalpha=subs(df,{alpha},{al(i-1)});
    ddfalpha=subs(ddf,{alpha},{al(i-1)});
    al(i)=al(i-1)-(dfalpha/ddfalpha);
    
    dfalphas=subs(df,{alpha},{al(i)});
    
   if(dfalphas<0.0000001)
       N=i;
       break
   end
    
end    

xf=x0-al(N).*l;
disp('The value of f'' alpha is');
disp(double(dfalpha));
disp('The value of f" alpha is');
disp(double(ddfalpha));
disp('The value of alpha is');
disp(al(2));
disp('The Minimizer is');
disp(double(xf));

disp('The Value of the Function at the Minimizer is');
disp(double(subs(f,{x,y},{xf(1),xf(2)})));


    