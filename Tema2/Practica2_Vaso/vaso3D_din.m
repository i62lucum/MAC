function vaso3D_din(opcion)

%Para crear una ventana ajustado al tamanyo de pantalla
figure('Units', 'Normalized', 'OuterPosition', [0 0 1 1])

%Se crean subplots
subplot(1,2,1);

%Se fijan las dimensiones
axis equal
axis([0 1 0 1])
hold on

%Se utiliza impoly para obtener los puntos
h=impoly(gca,'closed', false);

%Se obtienen las coordenadas de los puntos
pos=getPosition(h);

%Se crean los puntos para las curvas
t = linspace(0,1,100);

%Se anyaden callbacks para mover las curvas y se obtiene la curva
if opcion==0
    [x,y]=curva_spline(pos(:,1),pos(:,2),t);
    addNewPositionCallback(h,@callSpline);
else
    [x,y]=curva_bezier(pos(:,1),pos(:,2),t);
    addNewPositionCallback(h,@callBezier);
end

%Se dibuja la curva y se almacena para modificarla mas tarde
curva=plot(x,y,'color','r');

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

%Se crea el segundo grafico y se almacena para limpiarlo mas tarde
grafico=subplot(1,2,2);

%Se almacenan el grafico y la curva
setappdata(gcf,'grafico',grafico)
setappdata(gcf,'curva',curva)


%Se dibuja sobre el segundo subplot 
axis equal
surf(X,Y,Z,'FaceAlpha', 0.4);
axis([-1 1 -1 1 0 1])
shading interp



end