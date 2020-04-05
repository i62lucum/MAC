load('minCuad_data2.mat')


x=linspace(-1,1,100);


y=regresion_minimos(xi,yi,x,3);
clf
hold on
%Los puntos originales
plot(xi,yi,'r*')
%La funcion de regresion
plot(x,y)