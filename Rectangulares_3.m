%Teoria_Electromagnetica_1
%Proyecto_de_Simulacion
%Soluciones_de_la_Ecuacion_de_Laplace


%Coordenadas_Rectangulares
%Ejercicio_3
%Tuberia_Rectangular

%Se establecen valores iniciales
a = 2;
b = 2;
R = 0;
N = 20;
M = 20;
grad = 0;
epsilon0 = (8.85 .*(10^-12));

%Se definen ejes XY y la superficie creada por los mismos
X = 0:0.04:a;
Y = 0:0.04:b;
[x,y] = meshgrid(X,Y);
z = x;

%Se realiza la operacion obtenida como resultado
%Se utiliza un ciclo for para modelar la sumatoria
%Debido a que la sumatoria es doble se anidan dos ciclos for
for n = 1:N
    for m = 1:M
      var1 = n*pi/a;
      var2 = m*pi/b;
% Se realiza la integral entre sus respectivos limites de integracion
       integrando = @(Y,X) (4/a*b)*(X.*(Y^2)).*sin(var1.*Y).*sin(var2.*X);
       funcion = integral2(integrando,0,b,0,a);
%Se unen todos los elementos para obtener el resultado
       Q = funcion.*sin(var1*y).*sin(var2*x);
%Se suma el valor actual con el anterior con el fin de establecer el proceso de sumatoria
       R = Q+R;
       grad = grad + ((-1).*Q);
    end
 end
 
%Obtenemos el gradiente negado del portencial para sacar el campo
%obtenemos el gradiente de la función
[Ex, Ey] = gradient(grad);
Ex = -Ex;
Ey = -Ey;
Ez = sqrt (Ex.^2+Ey.^2);
%Obtenemos la densidad de carga 
%El resultado lo multiplicamos por E0
px = 2*epsilon0.* Ex;
py = 2*epsilon0.* Ex;
densidad = sqrt((px.^2)+(py.^2));


%GRAFICANDO 

%Graficamos el potencial y el campo electrico
subplot (1,2,1);
%Se define que se desea graficar y se nombra de manera correcta la grafica
quiver3(x, y, z, Ex, Ey, Ez);
hold on
surf(x, y, R);
hold off
title ('N = 20')
xlabel('Eje X')
ylabel('Eje Y')
zlabel('Eje Z')
view(-47,32)

%Graficamos densidad de carga
subplot (1,2,2);
hold on
surf(x, y, densidad);
hold off
title ('N = 20')
xlabel('Eje X')
ylabel('Eje Y')
zlabel('Eje Z')
view(-47,32)
