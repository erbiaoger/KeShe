 function [R,B,T,D] = Zoeppritz(Vp1,Vp2,Vs1,Vs2,a,p1,p2)
 
 [a1,a2,b1,b2,Vp1,Vp2,Vs1,Vs2] = Snell(Vp1,Vp2,Vs1,Vs2,a);
 A = [-sin(a1),Vp1/Vs1 * cos(b1),Vp1/Vp2 * sin(a2),Vp1/Vs2 * cos(b2);...
     cos(a1),Vp1/Vs1 * sin(b1),Vp1/Vp2 * cos(a2),-Vp1/Vs2 * sin(b2);...
     sin(2*a1),-(Vp1^2)/(Vs2^2) * cos(2*b2),((Vp1*Vs2)^2)/((Vp2*Vs1)^2)*(p1/p2)*sin(2*a2),(p1/p2)*(Vp1/Vs1)^2*cos(2*b2);...
     -cos(2*b1),-sin(2*b1),(p2/p1)*cos(2*b2),-(p2/p1)*sin(2*b2)];
 
[R;B;T;D] = [-sin(a1);cos(a1);sin(2*a1);-cos(2*b1)]/A
 
 