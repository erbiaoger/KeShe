clear all;

u0 = 4*pi*10^2;
h = 10;  
H = 12;  
Ms = 10;  %单位为 nT 
is = pi/2;  %有效磁化倾角
I0 =  pi/2;  %地磁场倾角
A1 = 0;  %x轴正方向地磁场北方向的夹角，若x轴与真北方向一致时，A’为地磁场的偏角
a = pi/4  ;  % 台阶倾斜面与下底水平面的夹角
beita = pi - a;
gama = beita - is;
b = 10;

x = -300:300;

rA = ( (x + b).^2 + h^2 ).^(1/2);
rB = ( (x + b + (H-h)* cot(a)).^2 + H^2 ).^(1/2);
rC = ( (x - b).^2 + h^2 ).^(1/2);
rD = ( (x - b + (H-h)* cot(a)).^2 + H^2 ).^(1/2);
faiA = atan( (x + b)./h );
faiB = atan( (x + b + (H-h)* cot(a))./H );
faiC = atan( (x - b)./h );
faiD = atan( (x - b + (H-h)* cot(a))./H );



Hax = 2*u0*Ms /(4*pi).* sin(beita).* ( cos(gama) .* log((rB.*rC)./(rA.*rD)) - sin(gama) .* ((faiA - faiB)-(faiC - faiD)));
Za  = 2*u0*Ms/(4*pi) .* sin(beita) .* ( sin(gama) .* log((rB.*rC)./(rA.*rD)) - cos(gama) .* ((faiA - faiB)-(faiC - faiD)));
dT = 2*u0*Ms /(4*pi).* sin(beita) .* ( (sin(gama) .* sin(I0) + cos(gama) .* cos(I0) .* cos(A1) ) ...
    .* log((rB.*rC)./(rA.*rD)) - (cos(gama) .* sin(I0) - sin(gama) .* cos(I0) .* cos(A1) ) .* (faiA - faiB) );

figure(1)
hold on
plot(x,Hax,'b');
plot(x,Za,'r');
plot(x,dT,'k');
xlabel('x方向');
ylabel('异常 (nT)');
title('台阶异常');
hold off