clear all
r1=200;% 
h1=400;% 第一个圆柱体的埋深，单位米
s1=pi*r1^2;% 第一个圆柱体的横截面积
p1=0.5*10^3;% 第一个圆柱体的剩余密度
G=6.67*10^(-11)*10^(6); %单位g.u.

r2=200;% 第二个圆柱体的半径，单位米
h2=400;% 第二个圆柱体的埋深，单位米
s2=pi*r2^2;% 第二个圆柱体的横截面积
p2=0.5*10^3;% 第二个圆柱体的剩余密度
for i=1:200
    x=20*(i-100);
    g(i)=2*G*p1*s1*h1/((x-420)^2+h1^2)+2*G*p2*s2*h2/(x^2+h2^2);%两个圆柱体相差20米
end
%求导
for j=11:190
  dg(j)=1.2732*g(j)-0.3979*(g(j+1)+g(j-1))-0.1061*(g(j+2)+g(j-2))-0.0398*(g(j+3)+g(j-3))-0.0212*(g(j+4)+g(j-4))-0.0133*(g(j+5)+g(j-5))-0.0091*(g(j+6)+g(j-6))-0.0066*(g(j+7)+g(j-7))-0.0051*(g(j+8)+g(j-8))-0.0040*(g(j+9)+g(j-9))-0.0024*(g(j+10)+g(j-10));
end
%加入随机噪声
y=rand(size(g));
g2=g+1*y;
%5点圆滑
for i=3:197
    mg(i)=(1/35)*(17*g2(i)+12*(g2(i+1)+g2(i-1))-3*(g2(i+2)+g2(i-2)));
end
%7点圆滑
for k=4:198
    fg(k)=(1/21)*(7*G(k)+6*(G(k+1)+G(k-1))+3*(G(k+2)+G(k-2))-2*(G(k+3)+G(k-3)));
end
figure(1)
plot(x,g)
xlabel('x(m)');
ylabel('g(g.u.)');
legend('g');
title('原异常')
figure(2)
plot(dg)
xlabel('点位');
ylabel('dg((g.u.)/m)');
legend('dg')
title('求导')
figure(3)
plot(x,G)
xlabel('x(m)');
ylabel('G(g.u.)');
legend('G');
title('加噪')
figure(4)
plot(mg)
xlabel('点位');
ylabel('mg(g.u.)');
legend('mg');
title('5点圆滑')
figure(5)
plot(fg)
xlabel('点位');
ylabel('fg(g.u.)');
legend('fg')
title('7点圆滑')
