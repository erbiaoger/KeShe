clear all;

u0 = 4*pi*10^2;
h = 100;  %球体中心埋深
R = 50;
V = (4/3)*pi*(R^3);  %球体1体积
M = 40;  %单位为 nT 
m = M*V ;  %球体的磁矩
i = pi/2;  %磁化倾角
dealtal = 0;  %x轴正方向与磁化方向水平分量的夹角
I0 =  pi/2;  %地磁场倾角
A1 = 0;  %x轴正方向UI地磁场北方向的夹角，若x轴与真北方向一致时，A’为地磁场的偏角
kesai = [100,120];
yita = [100,120];
seita = [100,120];
cosas = cos(i) * cos(dealtal);
cosbs = cos(i) *sin(dealtal);
cosrs = sin(i);

Hax1 = 0;
Hax2 = 0;
Hax3 = 0;
Hay1 = 0;
Hay2 = 0;
Hay3 = 0;
Za1 = 0;
Za2 = 0;
Za3 = 0;
dT1 = 0;
dT2 = 0;
dT3 = 0;
X = -200:10:200;
Y = -200:10:200;
Z = -200:10:200;
[x,y,z] = meshgrid(X,Y,Z);

for i = 1:2
    Hax1 = Hax2 - Hax1;
    Hay1 = Hay2 - Hay1;
    Za1 = Za2 - Za1;
    dT1 = dT2 - dT1;
    for j = 1:2
        Hax2 = Hax2 - Hax3;
        Hay2 = Hay2 - Hay3;
        Za2 = Za2 - Za3;
        dT2 = dT2 - dT3;
        for k = 1:2
            r = ( (x- kesai(i)).^2 + (y - yita(j)).^2 + (z - seita(k)) ).^0.5 ;
            Hax3 = -u0*M / (4*pi) * (cosas *( atan( (y-yita(i)) .* (z- seita(j) )./ ( (x-kesai(k) ) .* r ) ))...
                - cosbs * (log( r + seita(1) - seita(2) )) - cosrs * (log( r + yita(1) - yita(2) ))) - Hax3;
            Hay3 = -u0*M / (4*pi) * (cosas *(log( r + seita(1) - seita(2) ) ) )+ cosbs * (atan( (y-yita(i))...
                .* (z- seita(j) )./ ( (x-kesai(k) ) .* r ) ) - cosrs * (log( r + kesai(1) - kesai(2) ))) - Hay3;
            Za3 = -u0*M / (4*pi) * ( -cosas * log(r + yita(1) - yita(2)) - cosbs * log(r + kesai(1) - kesai(2)) ...
                + cosrs*atan( (y-yita(i)) .* (z- seita(j) )./ ( (x-kesai(k) ) .* r ) )) ;
            dT3 = -(Hax3 * cosas + Hay3 * cosbs + Za3 * cosrs) - dT3;
        end
    end
end
% plot(X,Hax1(100,:,100))
% % mesh(Hax1)
figure(1)
hold on
plot(X,Hax1(20,:,20),'b');
plot(Y,Hay1(:,20,20),'y');
plot(Z,Za1(20,:,20),'r');
% plot(X,dT1(110,:),'k');
xlabel('x方向');
ylabel('异常 (nT)');
hold off


