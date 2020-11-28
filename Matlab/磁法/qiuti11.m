clear all;

uo = 4*pi*10^2;
h = 30;  %球体中心埋深
R = 10;
V = (4/3)*pi*(R^3);  %球体1体积
M = 40;  %单位为 nT 
m = M*V ;  %球体的磁矩
I0 = pi/2;
A1 = 0;

X = -150:150;
Y = -100:100;
[x,y] = meshgrid(X,Y);

Hax = uo*m*( (2.*x.^2 - y.^2 - h^2) * cos(I0) * cos(A1) + 3.*x.*y.* cos(I0) * sin(A1) - 3.*x.*h* sin(I0) ) ./( 4*pi...
    .* (x.^2 + y.^2 + h^2).^(5/2) );
Hay = uo*m*( (2.*y.^2 - x.^2 - h^2) * cos(I0) * sin(A1) + 3.*x.*y.* cos(I0) * cos(A1) - 3.*y*h* sin(I0) ) / ( (4*pi...
    *(x.^2 + y.^2 + h^2).^(5/2)) );
 Za =   uo*m*( (2*h.^2 - x.^2 - y.^2) * sin(I0) - 3*x*h* cos(I0) * cos(A1) - 3*y*h* cos(I0) *sin(A1) ) ./ (4*pi*...
     (x.^2 + y.^2 +h^2).^(5/2)) ;
 dT = uo*m* ( (2*h^2 - x.^2 - y.^2) * (sin(I0))^2 + (2*x.^2 - y.^2 - h^2) * (cos(I0))^2 * (cos(A1))^2 + ...
     (2*y.^2 - x.^2 - h^2) * (cos(I0))^2 * (sin(A1))^2 - 3*x*h* sin(2*I0) * cos(A1) + 3*x.*y* cos(I0)^2 *sin(2*A1)...
     - 3*y*h* sin(2*I0) *sin(A1) ) ./( 4*pi*(x.^2 + y.^2 +h^2).^(5/2) );
figure(1)
hold on
plot(X,Hax(110,:),'b');
plot(y,Hay(:,100),'y');
plot(x,Za(100,:),'r');
plot(x,dT(110,:),'k');
xlabel('x方向');
ylabel('异常 (nT)');
hold off


