%Teoria_Electromagnetica_1
%Proyecto_de_Simulacion
%Soluciones_de_la_Ecuacion_de_Laplace


%Coordenadas_Esféricas
%Ejercicio_2
%Esferas Concentricas

%Se establecen valores iniciales
k = 5; 
a = 2; 
b = 4;  
R=10;
epsilon0 = (8.854187817)*(10.^(-12));  

%Se definen las funciones para lel potencial electrico en cada region
Va = @(r,theta) r-r;
Vb = @(r,theta) (k*b*a./(3*epsilon0.*r))-(k*b./(3*epsilon0))+((((2*k.*r.^2)./(15*epsilon0*b))-((2*k*a.^5)./(15*b*epsilon0.*r.^3))).*((3.*(cos(theta).^2))-1));
Vc = @(r,theta) ((k*b*(a-b))./(epsilon0*3.*r))+((2*k*((b.^5)-(a.^5))).*(((3.*(cos(theta).^2))-1))./(15*b*epsilon0.*(r.^3)));
%Se definen los ejes con los que se trabaja
ra = linspace(0,R,100)';
rb = linspace(a,b,100)';
rc = linspace(b,15,100)';
phi = linspace(0,2*pi,100)';

%Se definen las superficies para cada caso 
[Ra,Phi] = meshgrid(ra,phi);
[Rb,Phi] = meshgrid(rb,phi); 
[Rc,Phi] = meshgrid(rc,phi);

Pa = Va(Ra,Phi);  
Pb = Vb(Rb,Phi);  
Pc = Vc(Rc,Phi);   

%Realizamos cambio de coordenanas a cartesianas para graficar correctamente
[Xa,Ya] = pol2cart(Phi,Ra);
[Xb,Yb] = pol2cart(Phi,Rb);
[Xc,Yc] = pol2cart(Phi,Rc);


%Obtenemos el campo mediante el gradiente de del potencial
[EXa, EYa] = gradient(Pa);
EXa = -EXa;
EYa = EYa./Ra;
EZa = sqrt(EXa.^2+EYa.^2);

[EXb, EYb] = gradient(Pb);
EXb = -EXb;
Eb = EYb./Rb;
EZb = sqrt(EXb.^2+EYb.^2);

[EXc, EYc] = gradient(Pc);
EXc = -EXc;
EYc = EYc./Rc;
EZc = sqrt(EXc.^2+EYc.^2);


% Graficamos Potencial Eléctrico (Superficie)
subplot (2,2,2)
surfc(Xa,Ya,Pa)
surfc(Xb,Yb,Pb)
hold on
surfc(Xc,Yc,Pc)
hold off
xlabel('X')
ylabel('Y')
zlabel('Potencial Electrico')
view (-47,32)


%Graficamos Campo Eléctrico
subplot (2,2,3)
quiver3(Xa,Ya,Xa,EXa,EYa,EZa)
quiver3(Xb,Yb,Xb,EXb,EYb,EZb)
hold on
quiver3(Xc,Yc,Xc,EXc,EYc,EZc)
hold off
xlabel('X')
ylabel('Y')
view (-47,32)



%Graficamos Potencial Eléctrico (Curvas de Nivel)
subplot (2,2,1)
contourf(Xa,Ya,Pa)
contourf(Xb,Yb,Pb)
hold on
contourf(Xc,Yc,Pc)
hold off


xlabel('X')
ylabel('Y')
zlabel('Potencial Electrico')

colorbar



