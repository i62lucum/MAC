global a b w f0;
clf
t0 = 0; %Valor inicial del tiempo
v0 = 0; %Velocidad inicial
x0 = 2; %Posicion inicial
f0 = 0; %Fuerza inicial
w = 4; %Velocidad angular
b = 0.5; %Coeficiente para la fuerza elastica
h = 0.1; %Tamanyo del paso
k = 400; %Numero de pasos a dar

a = 0.4; %Coeficiente para el rozamiento

y0(1) = x0;
y0(2) = v0;

[xk, yk]=mHeun(@funcB, t0, y0, h, k);

yk = yk.';


plot(xk,yk(:,1))
xlabel("Tiempo")
ylabel("Posicion")