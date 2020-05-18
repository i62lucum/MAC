global a b;
clf
t0 = 0; %Valor inicial del tiempo
v0 = 10; %Velocidad inicial
x0 = 5; %Posicion inicial
a = 0.95; %Coeficiente para el rozamiento
b = 1; %Coeficiente para la fuerza elastica
h = 0.1; %Tamanyo del paso
k = 100; %Numero de pasos a dar
%func = @(t,z) -b^2*z(1)-2*a*z(2);

y0(1) = x0;
y0(2) = v0;

[xk, yk]=mHeun(@funcA, t0, y0, h, k);

yk = yk.'



plot(xk,yk(:,1))
xlabel("Tiempo")
ylabel("Posicion")

%input('')
%plot(xk,yk(:,2))


