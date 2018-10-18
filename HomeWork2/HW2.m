%% FunWork Question 1
% To find the Uncertainity region
X=zeros(2,100);
f=zeros(1,100);

Q=[2 1;0 3];      % Q Matrix
x0=[0.8;-0.25]; 
epsilon=0.075;    

X(:,1)=x0;
d=-(Q+Q')*X(:,1);
f(1)=X(:,1)'*Q*X(:,1);

for i=2:100
X(:,i)=X(:,(i-1))+(epsilon*d);
f(i)=X(:,i)'*Q*X(:,i);
epsilon=2*epsilon;
if((f(i-1)<f(i))&&(f(i-2)>f(i-1))&&(i>2))
    break
end
end

a=X(:,i-2);
b=X(:,i);

fprintf('The minimizer is located in the interval [a=[%f;%f] and b=[%f;%f]] \n',a(1),a(2),b(1),b(2));

%% FunWork Question 3
% Fibonacci Search
E=0.2;
epsilon=0.01;
Q=[2 1;0 3];      % Q Matrix

rho=zeros(1,100); % Ratio values
F=zeros(1,100); % Fibonacci Sequence.
F(1)=0;
F(2)=1;

D=norm(b-a);
fprintf('The initial width of the uncertainty interval is %f \n',D);
F_N1=(1+2*epsilon)*(D/E);

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


fa=a'*Q*a;
fb=b'*Q*b;

s = a + rho(1)*(b-a);
t = a + (1-rho(1))*(b-a);
ft=t'*Q*t;
fs=s'*Q*s;

fprintf('Initial Values\n');
fprintf('Initial interval [a=[%f;%f] and b=[%f;%f]] \n',a(1),a(2),b(1),b(2));
fprintf('a0=[%f,%f]\n',a(1),a(2));
fprintf('b0=[%f,%f]\n',b(1),b(2));
fprintf('f(a0)=[%f]\n',fa);
fprintf('f(b0)=[%f]\n',fb);
fprintf('Initial Value of s=[%f,%f]\n',s(1),s(2));
fprintf('Initial Value of t=[%f,%f]\n',t(1),t(2));
fprintf('Initial Value of f(s)=[%f]\n',fs);
fprintf('Initial Value of f(t)=[%f]\n',ft);
fprintf('\n');

for i=1:N
    if(fs<ft)
        b=t;
        t=s;
        s=a+rho(i+1)*(b-a);
        ft=fs;
        fs=s'*Q*s;
    else
        a=s;
        s=t;
        t=a+(1-rho(i+1))*(b-a);
        fs=ft;
        ft=t'*Q*t;
    end
    fprintf('\n');
    fprintf('Iteration number i=%d\n',i);
    fprintf('a%d = [%f,%f]\n',i,s(1,1),s(2,1));
    fprintf('b%d = [%f,%f]\n',i,t(1,1),t(2,1));
    fprintf('f(a%d) = [%f]\n',i,fs);
    fprintf('f(b%d) = [%f]\n',i,ft);
    fprintf('New width interval [a=[%f;%f] and b=[%f;%f]] \n',a(1),a(2),b(1),b(2));
    fprintf('width=%f\n',norm(b-a));
    
end
af=a;
bf=b;
D=norm(af-bf);
fprintf('The final width of the uncertainty interval is %f \n',D);
