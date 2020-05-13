

C = 10; %Constante
t0 = 0; %Valor inicial del tiempo
v0 = 2; %Velocidad inicial
x0 = 5; %Posicion inicial
a = 10;
b = 12;
h = 0.1; %Tamanyo del paso
k = 10; %Numero de pasos a dar
func = @(x,v) -b^2*x-2*a*v;


[xk,vk]=mHeun(func, x0, v0, h, k)


