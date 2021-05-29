%%MATLAB Code for FDM (Approach-2)
X = 1; % final x
Y = 1;% Final y
maxy = 400; %Number of time steps
dy = Y/maxy;
n=400; %number of space steps
dx = X/n;

% boundary conditions for y
for i=1:n+1
x(i)=(i-1)*dx;
u1(i,1)=cos(x(i));
u1(i,maxy+1) = 2*cos(x(i));
end

%boundary conditions for x
for j=1:maxy+1
u1(1,j)=0;
u1(n+1,j)=0;
y(j)=(j-1)*dy;
end

%implementation of the FDM method
for k=1:72000
for i=2:n
for j=2:maxy
u1(i,j) = (u1(i-1,j) + u1(i+1,j)+ u1(i,j-1) + u1(i,j+1))/4;
end
end
end


%Plotting
mesh(x,y,u1')
title('Laplace equation (FDM)- Approach 2')
xlabel('x', 'interpreter', 'latex')
ylabel('y', 'interpreter', 'latex')
zlabel('u', 'interpreter', 'latex')