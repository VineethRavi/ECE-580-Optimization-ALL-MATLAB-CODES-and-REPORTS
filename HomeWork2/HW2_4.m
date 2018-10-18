X=-3:0.1:3;
Y=X;
[x,y]=meshgrid(X);
    
z = 3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) - 1/3*exp(-(x+1).^2 - y.^2) ;

%{ 
surf(x,y,z);

[X,Y,Z] = peaks;
mesh(X,Y,Z);
figure
contour(X,Y,Z,20);
%}

mesh(x,y,z);
xlabel('X');
ylabel('Y');
zlabel('Z=F(X,Y)');
title('Mesh 3D Peaks');

figure;

contour(x,y,z,20);
xlabel('X');
ylabel('Y');
title('Contours Peaks');

