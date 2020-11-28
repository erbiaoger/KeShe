clear all;

R1 = 30;
h1 = 60;  
z1 = h1;
G = 6.67*10^(-5);  %单位g.u.
p1 = 1*10^3;
S1 = pi*R1^2;
d1 = p1*S1;

for i = 1:2000
    x = i-1000;
    g(i) = 2*G*d1*h1/((x+500)^2+h1^2);  %两水平无限长圆柱体相差500米
end

figure(1)
x = 1:2000;
plot(x,g);
xlabel('位置');
ylabel('异常(g.u.)');
title('浅部场');
