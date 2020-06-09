%Teoria_Electromagnetica_1
%Proyecto_de_Simulacion
%Soluciones_de_la_Ecuacion_de_Laplace


%Coordenadas_Rectangulares
%Ejercicio_1a
%Tuberia_Rectangular

%Se establecen valores iniciales
a = 2;
b = 4;
R = 0;
grad = 0;
%N = 2;
%N = 5;
%N = 10;
N = 20;
epsilon0 = (8.85 .*(10^-12));

%Se definen ejes XY y la superficie creada por los mismos
X = 0:0.05:a;
Y = 0:0.05:b;
[x,y] = meshgrid(X,Y);
z = x;

%Se realiza la operacion obtenida como resultado
%Se utiliza un ciclo for para modelar sa sumatoria
for n = 1:N
% Se realiza la integral entre sus respectivos limites de integracion
    integrando = @(Y) sin(n*pi*Y./b).*(atan(Y./a));
    funcion = integral(integrando,0,b);
%Se define el valor de la constante que acompaña a la integral
    cte = 2./(b*sinh(n*pi*a./b));
%Se unen todos los elementos para obtener el resultado
    Q = funcion.*cte.*(sinh(n*pi*x./b)).*(sin(n*pi*y./b));
%Se suma el valor actual con el anterior con el fin de establecer el proceso de sumatoria
    R = Q+R;
    grad = grad + ((-1).*Q);
end

%Obtenemos el gradiente negado del portencial para sacar el campo
%obtenemos el gradiente de la función
[Ex, Ey] = gradient(grad);
%Direccionamos los vectores del diagrama vectorial (Grafica campo electrico)
Ex = -Ex;
Ey = -Ey;
Ez = sqrt (Ex.^2+Ey.^2);

%Obtenemos la densidad de carga 
%El resultado lo multiplicamos por 2*E0
px = 2*epsilon0.* Ex;
py = 2*epsilon0.* Ey;
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



