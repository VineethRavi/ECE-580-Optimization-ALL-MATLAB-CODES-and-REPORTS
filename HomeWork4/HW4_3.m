A = [1 1 1];
b=1 ;
x0=[0;-3;0];


x=A'*inv(A*A')*b + (eye(3)-A'*inv(A*A')*A)*x0;

norm(x-x0)