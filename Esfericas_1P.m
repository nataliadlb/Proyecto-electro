%Teoria_Electromagnetica_1
%Proyecto_de_Simulacion
%Soluciones_de_la_Ecuacion_de_Laplace


%Coordenadas_Esféricas
%Ejercicio_1
%Esfera Radio R

%Se establecen valores iniciales
R = 2; 
epsilon0 = (8.854187817)*(10.^(-12)); 

%Se definen las funciones para lel potencial electrico en cada region
Vin = @(r,theta) (3.*r.*cos(theta)./(10*epsilon0))-((12.*(r.^3)./(35*epsilon0*(R.^2))).*((5.*((cos(theta)).^3)./2)-((3.*cos(theta))./2)));
Vout = @(r,theta) (3.*(R.^3).*cos(theta)./(10*epsilon0.*(r.^2)))-((12*(R.^5)./(35*epsilon0*(r.^4))).*((5.*((cos(theta)).^3)./2)-((3.*cos(theta))./2)));

%Se definen los ejes con los que se trabaja
rin = linspace(0,R,50)';
rout = linspace(R,10,50)';
phi = linspace(0,2*pi, 50)';

%Se definen las superficies para cada caso
[Rin, Phi] = meshgrid(rin,phi); 
[Rout, Phi] = meshgrid(rout,phi); 

Pin = Vin(Rin,Phi);  
Pout = Vout(Rout,Phi);  
%Realizamos cambio de coordenanas a cartesianas para graficar correctamente
[Xin,Yin] = pol2cart(Phi,Rin);
[Xout,Yout] = pol2cart(Phi,Rout);

%Obtenemos el campo mediante el gradiente de del potencial
[EXin, EYin] = gradient(Pin);
EXin = -EXin;
EYin = EYin./Rin;
EZin = sqrt(EXin.^2+EYin.^2);

[EXout, EYout] = gradient(Pout);
EXout = -EXout;
EYout = EYout./Rout;
EZout = sqrt(EXout.^2+EYout.^2);


% Graficamos Potencial Eléctrico (Superficie)
subplot (1,2,1)
surfc(Xout,Yout,Pout)
hold on
surfc(Xin,Yin,Pin)
hold off


%Graficamos Campo Eléctrico
subplot (1,2,2)
quiver3(Xout,Yout,Xout,EXout,EYout,EZout)
hold on
quiver3(Xin,Yin,Xin,EXin,EYin,EZin)
hold off
xlabel('X')
ylabel('Y')
zlabel('Potencial Electrico')
view (-47,32)



%subplot (1,2,2)
%hold on
%quiver3(Xout,Yout,Xout,EXout,EYout,EZout)
%hold off
%xlabel('X')
%ylabel('Y')
%view (-47,32)
%zlabel('Potencial Electrico')


%Graficamos Potencial Eléctrico (Curvas de Nivel)
subplot (1,2,1)
contourf(Xout,Yout,Pout)
hold on
contourf(Xin,Yin,Pin)
hold off


xlabel('X')
ylabel('Y')
zlabel('Potencial Electrico')

colorbar






