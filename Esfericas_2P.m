k = 5; 
a = 2; 
b = 4;  
R=10;
epsilon0 = (8.854187817)*(10.^(-12));  


%r = linspace(0,R,50)';
r = linspace(a,b,50)';
%r = linspace(b,15,50)';
phi = linspace(0,2*pi,50)';




%Vin = @(r,theta) (r-r);
Vin = @(r,theta)(-k*b./(3*epsilon0))+(k*b*a./(3*epsilon0.*r))+((((4*k.*r.^2)./(15*epsilon0*b))-((4*k*a.^5)./(15*b*epsilon0.*r.^3))).*3.*cos(theta).^2-1)./2;;
%Vin = @(r, theta)(-k*b*(b-a)./(epsilon0*3.*r))+(4*k*((b.^5)-(a.^5))).*(((3.*cos(theta))-1)./(30*b*epsilon0.*(r.^3)));
 
[Rin,Phi] = meshgrid(r,phi);
%[Rout,Phi] = meshgrid(r,phi); 

Pin = Vin(Rin,Phi);  
%Pout = Vout(Rout,Phi);  

[Xin,Yin] = pol2cart(Phi,Rin);
%[Xout,Yout] = pol2cart(Phi,Rout);



%__________________________________________________________________
[EXin,EYin,EZin] = surfnorm(Pin);
quiver3(Xin, Yin, Xin, EXin, EYin, EZin)
title ('Región 2')
xlabel ('Radio')
ylabel ('Phi')


%subplot (1,2,1)
%hold on
%contourf(Xin,Yin,Pin)
%hold off
%xlabel ('Radio')
%ylabel ('Phi')

%subplot (1,2,2)
%hold on
%surfc(Xin,Yin,Pin)
%hold off
%xlabel ('Radio')
%ylabel ('Phi')
%zlabel ('Potencial')



