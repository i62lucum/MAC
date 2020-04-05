close all
clc

% Vamos a dibujar un toro, esto es la figura que se origina al rotar una
% circunferencia a lo largo del eje y
%
% Para ello, primero vamos a definir una circunferencia de radio 1 y centro
% (2,0), es decir 
% x(t) = 2+cos(2*pi*t)
% y(t) = sin(2*pi*t)
% t \in [0,1]
t = linspace(0,1,40);
x=2+cos(2*pi*t);
y=sin(2*pi*t);
plot(x,y)
axis([-3.5,3.5,-1.5,1.5])
axis equal


disp('Pulsa INTRO para continuar')
pause

% Ahora hay que hacer que la curva anterior gire alrededor del eje Y
% Para ello, usamos un nuevo parametro s que va a representar el angulo de
% giro
s = linspace(0,2*pi,40);

% Para hacer un dibujo en tres dimensiones con Matlab, tenemos que mezclar
% evaluar en cada punto (t(i),s(j)). Para generar esa malla con todos esos
% puntos se usa el comando meshgrid
[T,S] = meshgrid(t,s);

% Ahora, evaluamos los puntos de la superficie del toro. La superficie de
% revolucion dada por una curva (x(t),y(t)) viene dada por:
%X = x(T)*cos(S);
%Y = x(T).*sin(S);
%Z = y(T);

X=(2+cos(2*pi*T)).*cos(S);
Y=(2+cos(2*pi*T)).*sin(S);
Z=sin(2*pi*T);

surf(X,Y,Z,'FaceAlpha', 0.4)
axis equal

disp('Pulsa INTRO para continuar')
pause

shading interp
