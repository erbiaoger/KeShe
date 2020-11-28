clear all;

u0 = 4*pi*10^2;
h = 10;  
H = 12;  
Ms = 10;  %单位为 nT 
is = pi/2;  %有效磁化倾角
I0 =  pi/2;  %地磁场倾角
A1 = 0;  %x轴正方向地磁场北方向的夹角，若x轴与真北方向一致时，A’为地磁场的偏角
a = pi/4  ;  % 台阶倾斜面与下底水平面的夹角

x = -300:300;

rA = ( (x + h* cot(a)).^2 + h^2 ).^(1/2);
rB = ( (x + H* cot(a)).^2 + H^2 ).^(1/2);
faiA = atan( (x + h* cot(a))./h );
faiB = atan( (x + H* cot(a))./H );

Hax = 2*u0*Ms * sin(a) * ( -cos(a+is) .* log(rB./rA) - sin(a+is) * (faiA - faiB));
Za  = 2*u0*Ms * sin(a) * ( sin(a+is) .* log(rB./rA) - cos(a+is) * (faiA - faiB));
dT = 2*u0*Ms * sin(a) * ( (sin(a+is) * sin(I0) - cos(a+is) * cos(I0) * cos(A1) ) ...
    .* log(rB./rA) - (cos(a+is) * sin(I0) + sin(a+is) * cos(I0) * cos(A1) ) * (faiA - faiB) );

figure(1)
hold on
plot(x,Hax,'b');
plot(x,Za,'r');
plot(x,dT,'k');
xlabel('x方向');
ylabel('异常 (nT)');
title('台阶异常');
hold off