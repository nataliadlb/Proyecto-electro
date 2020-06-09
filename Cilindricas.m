%% Proyecto final - Teoría electromagnética 1
%  Definir variables
radio = 1;
E = 3;
% Crear malla de valores en r y teta (t)
r = linspace(radio,10,70);
t = linspace(0,2*pi,70);
[R,T] = meshgrid(r,t);

%Convertir a cartesianas
X = R.*cos(T);
Y = R.*sin(T);

% Evaluar cada valor de la malla en la ecuación encontrada del potencial
Z = E.*R.*((radio./R).^(2) -1).*cos(T);

%Graficar cilindro
r_cil = linspace(radio,radio,70);
R_cil = meshgrid(r_cil);
X_cil = R_cil.*cos(T);
Y_cil = R_cil.*sin(T);
z_cil = linspace(-40,40,70);
Z_cil = meshgrid(z_cil);

% Graficar cilindro + potencial afuera de él
figure(1);
surf(X_cil,Y_cil,Z_cil,'FaceColor','k', 'FaceAlpha',0.5, 'EdgeColor','none');
hold on;
surfc(X,Y,Z);
colormap hsv;
colorbar;
xlabel('Eje x');
ylabel('Eje y');
zlabel('Eje z');
