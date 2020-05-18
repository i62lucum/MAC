global a b w f0;
clf
t0 = 0; %Valor inicial del tiempo
v0 = 0; %Velocidad inicial
x0 = 2; %Posicion inicial
f0 = 5; %Fuerza inicial
w = 4; %Velocidad angular
a = 0.6; %Coeficiente para el rozamiento
b = 1; %Coeficiente para la fuerza elastica
h = 0.1; %Tamanyo del paso
k = 400; %Numero de pasos a dar


y0(1) = x0;
y0(2) = v0;

[xk, yk]=mHeun(@funcB, t0, y0, h, k);

yk = yk.';


plot(xk,yk(:,1))
xlabel("Tiempo")
ylabel("Posicion")

%nombre = "Imagenes/"+"B_"+num2str(a)+"_"+num2str(b)+"_"+num2str(x0)+"_"+num2str(w)+"_"+num2str(f0)+".png";
%saveas(gcf,nombre);