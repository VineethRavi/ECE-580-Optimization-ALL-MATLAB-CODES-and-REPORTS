function  [result]=alphaFibonacci(H,D)

syms c d al

z= 20 + (0.01)*(c.^2) +  (0.01)*(d.^2) - 10*(cos(0.2*pi*c)+cos(0.2*pi*d));

Y0=H;
m=D;

Yalp=Y0+al*m;

fYalp=subs(z,{c,d},{Yalp(1),Yalp(2)});

% Bracketing

W=zeros(1,1000);
fval=zeros(1,1000);
delta=0.00001;
W(1)=0;

dal=-gradient(fYalp,[al]);
dalval=subs(dal,{al},{W(1)}); 
fval(1)=subs(fYalp,{al},{W(1)});

for i=2:1000
W(i)=W(i-1)+(delta*dalval);
fval(i)=subs(fYalp,{al},{W(i)});
delta=2*delta;
if((i>2)&&(fval(i-1)<fval(i))&&(fval(i-2)>fval(i-1)))
    break
end
end

p=W(i-2);
q=W(i);

% Fibonacci Search

E=0.01;
epsilon=0.001;

Dist=norm(q-p);

rho=zeros(1,100); % Ratio values
F=zeros(1,100); % Fibonacci Sequence.
F(1)=0;
F(2)=1;

F_N1=(1+2*epsilon)*(Dist/E);

for i=3:100
    F(i)=F(i-1)+F(i-2);
    if(F(i)>=F_N1)
        break;
    end
end

N=i-3;

for i=1:N
    rho(i)=1-(F(N+3-i)/F(N+4-i));
end
rho(N)=rho(N)-epsilon;

s = p + rho(1)*(q-p);
t = p + (1-rho(1))*(q-p);
ft=double(subs(fYalp,{al},{t}));
fs=double(subs(fYalp,{al},{s}));

for i=1:N
    if(fs<ft)
        q=t;
        t=s;
        s=p+rho(i+1)*(q-p);
        ft=fs;
        fs=double(subs(fYalp,{al},{s}));
    else
        p=s;
        s=t;
        t=p+(1-rho(i+1))*(q-p);
        fs=ft;
        ft=double(subs(fYalp,{al},{t}));
    end
end

pfin=p;
qfin=q;

result=(pfin+qfin)/2;


end