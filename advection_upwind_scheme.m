

clear all;
tic
L = 12; %lenght
T = 3;%Final time

maxk = 200; %Number of time steps

dt = T/maxk;
n=50; %2number of space steps
dx = L/n;
alpha = 1;
b = alpha^2*dt/(dx);
x = zeros(n,1);
x(1) = -4;
%initial condition 
for i=2:n+1
    x(i)=x(i-1)+dx;
    u(i,1)=0.1+ (1/sqrt(2*pi))*exp(-x(i)^2/2);
end

%
for k=1:maxk+1
    u(1,k)=0.1001;
    u(n+1,k)=0.1;
    time(k)=(k-1)*dt;
end


%implementation of the explicit method
for k=1:maxk
    for i=2:n
        u(i,k+1)=u(i,k)*(1-b) + b*u(i-1,k);
    end
end

toc


figure(2)
mesh(x,time,u')
xlabel('x', 'interpreter', 'latex')
ylabel('t', 'interpreter', 'latex')
zlabel('u', 'interpreter', 'latex')
set(gca, 'fontsize', 15)



    