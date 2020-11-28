function [a1,a2,b1,b2,Vp1,Vp2,Vs1,Vs2] = Snell(Vp1,Vp2,Vs1,Vs2,a)

% Vp1 ∑¥…‰◊›≤®
% VP2 Õ∂…‰◊›≤®
% Vs1 ∑¥…‰∫·≤®
% Vs2 Õ∂…‰∫·≤®
% a   »Î…‰Ω«
a1 = a;
a2 = asin(Vp2/Vp1 * sin(a));
b1 = asin(Vs1/Vp1 * sin(a1));
b2 = asin(Vs2/Vp1 * sin(a1));
%  