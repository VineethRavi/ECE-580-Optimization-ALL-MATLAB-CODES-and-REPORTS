function [result]=computealpha(H)

syms x y

f = 3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) - 1/3*exp(-(x+1).^2 - y.^2) ;

%f=2*(x.^2)+(x.*y)+(3*y.^2);

x0=H;
syms alphab

grad_f=gradient(f);
l=subs(grad_f,{x,y},{x0(1),x0(2)});

xalpha=x0-alphab*l;

falpha=subs(f,{x,y},{xalpha(1),xalpha(2)});

al=[];

al(1)=0;

for i=2:10000
    
    df=diff(falpha,alphab);
    ddf=diff(df,alphab);
    dfalpha=subs(df,{alphab},{al(i-1)});
    ddfalpha=subs(ddf,{alphab},{al(i-1)});
    al(i)=al(i-1)-(dfalpha/ddfalpha);
    
    dfalphas=subs(df,{alphab},{al(i)});
    
     if(al(i)<0)
        al(i)=-al(i);
    end
    
    %disp(al(i));
              
   if(dfalphas<0.0000001)
       N=i;
       break
   end
    
end    

xf=x0-al(N).*l;

result=al(N);
    
end
