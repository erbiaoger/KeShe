clear all;

u0 = 4*pi*10^2;
h = 30;  %球体中心埋深
R = 10;
S = 4*pi*R^2;  %球体1体积
Ms = 10 ;  %单位为 A/m 
ms = Ms*S ;  %球体的磁矩
I0 =  pi/2;  %地磁场倾角
is = I0;  %有效磁化倾角
A1 = 0;  %x轴正方向UI地磁场北方向的夹角，若x轴与真北方向一致时，A’为地磁场的偏角

x = -150:150;

Hax = 2*u0*ms* ( -(h^2 - x.^2) * cos(is) - 2*h.*x * sin(is) ) ./ (4*pi.*(x.^2 + h^2).^ 2) ;
Za  = 2*u0*ms* ( (h^2 - x.^2) * sin(is) - 2*h*x*cos(is) ) ./ (4*pi*(x.^2 + h^2).^ 2) ;
dT = 2*u0*ms  * ( (h^2 - x.^2) * ( sin(is) * sin(I0) - cos(is) * cos(I0) * cos(A1) ) - ...
    2*h*x* (cos(is) * sin(I0) + sin(is) * cos(I0) *cos(A1) ) )./ (4*pi*(x.^2 + h^2).^ 2);

figure(1)
hold on
plot(x,Hax,'b');
plot(x,Za,'r');
plot(x,dT,'k');
xlabel('x方向');
ylabel('异常 (nT)');
title('水平无限长圆柱体异常');
hold off

