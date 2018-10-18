function  [result]=AlphaTRY(H)

syms c d al

%z = 3*(1-c).^2.*exp(-(c.^2) - (d+1).^2) - 10*(c/5 - c.^3 - d.^5).*exp(-c.^2-d.^2) - 1/3*exp(-(c+1).^2 - d.^2) ;
z= 20 + (0.01)*(c.^2) +  (0.01)*(d.^2) - 10*(cos(0.2*pi*c)+cos(0.2*pi*d));
Y0=H;

grad_F=gradient(z);

m=subs(grad_F,{c,d},{Y0(1),Y0(2)});

Yalp=Y0-al*m;

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

% Golden Search

E = 0.02;
rho=(3-sqrt(5))/2;  % Golden Ratio

Dist=norm(q-p);

Niter=ceil((log(E/Dist))/(log(1-rho)));

s = p + rho*(q-p);
t = p + (1-rho)*(q-p);
ft=double(subs(fYalp,{al},{t}));
fs=double(subs(fYalp,{al},{s}));

for i=1:Niter
    if(fs<ft)
        q=t;
        t=s;
        s=p+rho*(q-p);
        ft=fs;
        fs=double(subs(fYalp,{al},{s}));
    else
        p=s;
        s=t;
        t=p+(1-rho)*(q-p);
        fs=ft;
        ft=double(subs(fYalp,{al},{t}));
    end
end

pfin=p;
qfin=q;

result=(pfin+qfin)/2;

end