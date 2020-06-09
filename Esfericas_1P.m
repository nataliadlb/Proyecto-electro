e psilon0 = (8.854187817)*(10.^(-12));  
R=2;

r = linspace(0,R,50)';
%r = linspace(R,10,50)';
phi = linspace(0,2*pi,50)';



Vin = @(r,theta) (((3.*r.*cos(theta))/10.*epsilon0)-((12.*(r.^3))/(35.*epsilon0.*(R.^2)))).*((5.*((cos(theta)).^3)/2)-((3.*cos(theta))/2));
%Vin = @(r,theta)(3.*(R.^3).*cos(theta)./(10*epsilon0.*(r.^2)))-((12*(R.^5)./(35*epsilon0*(r.^4))).*((5.*((cos(theta)).^3)./2)-((3.*cos(theta))./2)));
 
[Rin,Phi] = meshgrid(r,phi);

Pin = Vin(Rin,Phi);  
 
[Xin,Yin] = pol2cart(Phi,Rin);

%__________________________________________________________________
[EXin,EYin,EZin] = surfnorm(Pin);
quiver3(Xin, Yin, Xin, EXin, EYin, EZin)
title ('Región Externa')
xlabel ('Radio')
ylabel ('Phi')


%subplot (1,2,1)
%hold on
%contourf(Xin,Yin,Pin)
%hold off
%title ('Potencial Esfera Radio R')
%xlabel ('Radio')
%ylabel ('Phi')

%subplot (1,2,2)
%hold on
%surfc(Xin,Yin,Pin)
%hold off
%xlabel ('Radio')
%ylabel ('Phi')
%zlabel ('Potencial')




