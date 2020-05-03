function callSpline(pos)

%Se crean los puntos para las curvas
t= linspace(0,1,100);

%Se obtiene la curva
[x,y]=curva_spline(pos(:,1),pos(:,2),t);

%Valores del angulo
s = linspace(0,2*pi,40);
%Indice de acceso
t = linspace(1,length(x),length(x));
%Se obtiene una correspondencia para acceder
[T,S] = meshgrid(t,s);

%Coordenadas en 3D
X=x(T).*cos(S);
Y=x(T).*sin(S);
Z=y(T);

%Se obtiene la curva para modificar sus datos
curva=getappdata(gcf,'curva');


set(curva,'XData',x);
set(curva,'YData',y);

%Se obtiene el grafico para limpiarlo
grafico=getappdata(gcf,'grafico');
cla(grafico);

%Se accede al segundo subplot
subplot(1,2,2);
%Se dibuja sobre el segundo subplot
axis equal
surf(X,Y,Z,'FaceAlpha', 0.4);
axis([-1 1 -1 1 0 1])
shading interp

end