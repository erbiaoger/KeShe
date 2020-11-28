clear all;

G = 6.67*10^(-5);  %单位g.u.
R2 = 200;  %球体2半径
h2 = 300;  %球体2深度
z2 = h2;
V2 = (4/3)*pi*(R2^3);  %球体2体积
p2 = 0.6*10^3;     %球体2剩余密度 

for i = 1:1000
    for j = 1:1000
        x = i-500;
        y = j-500;
        g(i,j) = G*p2*V2*h2/((x^2+y^2+z2^2)^(3/2));  
    end
end

figure(1)
contour(g,'ShowText','on')
xlabel('x方向');
ylabel('y方向');
title('深部场');

