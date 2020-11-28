clear all;

G = 6.67*10^(-5);  %单位g.u.

R1 = 40;  %球体1半径
h1 = 50;  %球体1深度
z1 = h1;
V1 = (4/3)*pi*(R1^3);  %球体1体积
p1 = 1.0*10^3;     %球体1剩余密度 

R2 = 200;  %球体2半径
h2 = 300;  %球体2深度
z2 = h2;
V2 = (4/3)*pi*(R2^3);  %球体2体积
p2 = 0.6*10^3;     %球体2剩余密度 

x = -500:500;
y = -500:500;
[X,Y] = meshgrid(x,y);
g = G*p1*V1*h1./(((X+300).^2+(Y-100).^2+z1^2).^(3/2))+G*p2*V2*h2./((X.^2+Y.^2+z2^2).^(3/2));

figure(1)
contour(g,'ShowText','on')
xlabel('x方向');
ylabel('y方向');
title('深部场');
