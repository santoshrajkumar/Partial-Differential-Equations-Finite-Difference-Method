clear;

L = 1; %lenght
T = 2;%Final time

maxk = 2500; %Number of time steps

dt = T/maxk;
n=100; %number of space steps
dx = L/n;
alpha = 0.1;
b = alpha^2*dt/(dx^2);


for i=1:n+1
    x(i)=(i-1)*dx;
    u(i,1)=5*sin(3*pi*x(i)/2);
end

for k=1:maxk+1
    u(1,k)=0.;
    u(n+1,k)=5*sin(3*pi*L/2);
    time(k)=(k-1)*dt;
end

%implementation of the explicit method
for k=1:maxk
    for i=2:n
        u(i,k+1)=u(i,k)+b*(u(i-1,k)+u(i+1,k)-2.*u(i,k));
    end
end


%closed for solution code
for i=1:n+1
    for j=1:maxk+1
        ua(i,j) = 5*sin(3*pi*x(i)/2)*exp(-(3*0.1/2)^2 *time(j));
    end
end


figure(1)
plot(x,ua(:,maxk-20),'linewidth', 2.5)
hold on
plot(x,u(:,maxk-20), 'r','linewidth', 2.5)
title('Comparison of FTCS & Closed Form Solution')
xlabel('x', 'interpreter', 'latex')
ylabel('solution (u)', 'interpreter', 'latex')
set(gca, 'fontsize', 15)
legend

figure(2)
mesh(x,time,u')
xlabel('x', 'interpreter', 'latex')
ylabel('t', 'interpreter', 'latex')
zlabel('u', 'interpreter', 'latex')
set(gca, 'fontsize', 25)


