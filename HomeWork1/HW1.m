%% FunWork Question 1
e=exp(i*2*pi/3);
A=[1 1 e;1 1 e^2;e^2 e 1];
answer=det(A);
anscheck=(e^2-e)^2;
disp(answer);
%% FunWork Question 2
syms a b c
A=[4*b*c a*c -2*a*b;5*b*c 3*a*c -4*a*b;3*b*c 2*a*c -a*b];
B=transpose([0 -a*b*c 4*a*b*c]);
X=linsolve(A,B);
Ycheck=A\B;
disp(X);
disp(det(A));
%% FunWork Question 3
A=[3 2 -5;2 6 -10; 1 2 -3];
B=[6 20 -34;6 32 -51;4 20 -32];
[V,J]=jordan(A);
[U,K]=jordan(B);
%Since J = K, (Jordan formas) => The matrices A and B are similar
T=V/U;
disp(T);
disp(inv(T));
AnsCheck=T\A*T;
disp(AnsCheck);
% Hence Similarity transform is found.
%% FunWork Question 4
% From Row echelon form we get RANK = 2
syms x3 x4
A=[1 1;1 2];
B=transpose([1+2*x3-3*x4 3+x3-2*x4]);
X=linsolve(A,B);
Ycheck=A\B; 
disp(X);
%% FunWork Question 5
A=[3 2 1;5 4 3;4 3 2];
Z=null(A);
disp(Z);
%% FunWork Question 10
A1=[1 2;2 4+sqrt(5)];
A2=[1 2;2 4-sqrt(5)];
disp(eig(A1));
disp(eig(A2));

%%

%%

%%

%%

%%