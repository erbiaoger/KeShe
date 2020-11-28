clear all;

u0 = 4*pi*10^2;
h = 100;  %球体中心埋深
R = 50;
S = 4*pi*R^2;  %球体1体积
Ms = 40;  %单位为 nT 
ms = Ms*S ;  %球体的磁矩
I0 =  pi/2;  %地磁场倾角
is = I0;  %有效磁化倾角
A1 = 0;  %x轴正方向UI地磁场北方向的夹角，若x轴与真北方向一致时，A’为地磁场的偏角


for i = 1:300
    x = i - 150;
    Hax(i) = 2*u0*ms / (4*pi*(x^2 + h*2) ^ 2) * ( -(h^2 - x^2) * cos(is) - 2*h*x * sin(is) );
    Za(i)  = 2*u0*ms / (4*pi*(x^2 + h*2) ^ 2) * ( (h^2 - x^2) * sin(is) - 2*h*x*cos(is) );
    dT(i) = 2*u0*ms / (4*pi*(x^2 + h*2) ^ 2) * ( (h^2 - x^2) * ( sin(is) * sin(I0) - cos(is) * cos(I0) * cos(A1) ) - ...
        2*h*x* (cos(is) * sin(I0) + sin(is) * cos(I0) *cos(A1) ) );

end

x = -149:150;

figure(1)
hold on
plot(x,Hax,'b');
plot(x,Za,'r');
plot(x,dT,'k');
xlabel('x方向');
ylabel('异常 (nT)');
hold off
