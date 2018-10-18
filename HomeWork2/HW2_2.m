%% FunWork Question 2
% Golden Section Search
E=0.2;
Q=[2 1;0 3];      % Q Matrix
rho=(3-sqrt(5))/2;  % Golden Ratio
D=norm(a-b);
fprintf('The initial width of the uncertainty interval is %f \n',D);
N=ceil((log(E/D))/(log(1-rho)));
fprintf('The Number of necessary iterations required is %d \n\n',N);

fa=a'*Q*a;
fb=b'*Q*b;

s = a + rho*(b-a);
t = a + (1-rho)*(b-a);
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
        s=a+rho*(b-a);
        ft=fs;
        fs=s'*Q*s;
    else
        a=s;
        s=t;
        t=a+(1-rho)*(b-a);
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