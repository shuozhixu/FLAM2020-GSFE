%% Unstable stacking fault energy
%% Ideal shear strength

a0 = 3.2208; % lattice parameter
bur = a0 * sqrt(3.) / 2.; % magnitude of the Burgers vector

path='./';
file1='gsfe';
data1=load(strcat(path,file1));
[nx, ny]=size(data1);
interval=1;
stress=abs(data1(1:interval:nx,2))-abs(data1(1,2));
disp=data1(1:interval:nx,1);

dx=data1(2,1)-data1(1,1);
slope=abs(gradient(abs(data1(1:interval:nx,2)))/dx)/bur*0.01;

peierls=[0 0];
target=peierls;
lefthalf=floor(nx/2);
[peierls(1),target(1)]=max(abs(slope(1:lefthalf)));
[peierls(2),target(2)]=max(abs(slope(lefthalf+1:nx)));
target(2) = target(2) + lefthalf;

peierls_disp=disp(target);
peierls_slope=slope(target);
usfe=max(data1(:,2))
iss=max(peierls_slope(1), peierls_slope(2))