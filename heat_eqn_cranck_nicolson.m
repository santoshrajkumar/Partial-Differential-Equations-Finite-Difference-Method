%%Crank-Nicolson Method for solving heat equation

clear all;

alpha = 0.1;

%length of rod
L=1;
%final time
tf=1;


nmax=500; %number of time steps
dt = tf/nmax; %step size in time

jmax=50; %number of steps in space
dx=L/jmax;

r=alpha^2*dt/(dx^2);

%initial condition
for j=1:jmax+1
    x(j)=(j-1)*dx;
    u(j,1)=5*sin(3*pi*x(j)/2);
end

%boundary condition
for n=1:nmax+1
    u(1,n)=0;
    u(jmax+1,n)=5*sin(3*pi*L/2);
    t(n)=(n-1)*dt;
end


%implementation of CN method
aal(1:jmax-2)=-r;
bbl(1:jmax-1)=2.+2.*r;
ccl(1:jmax-2)=-r;
MMl=diag(bbl,0)+diag(aal,-1)+diag(ccl,1);

aar(1:jmax-2)=r;
bbr(1:jmax-1)=2.-2.*r;
ccr(1:jmax-2)=r;
MMr=diag(bbr,0)+diag(aar,-1)+diag(ccr,1);

for j=1:nmax
    u(2:jmax,j+1)= MMl\MMr*u(2:jmax,j);
end

mesh(x,t,u')
xlabel('x', 'interpreter', 'latex')
ylabel('t', 'interpreter', 'latex')
zlabel('u', 'interpreter', 'latex')
set(gca, 'fontsize', 25)
    