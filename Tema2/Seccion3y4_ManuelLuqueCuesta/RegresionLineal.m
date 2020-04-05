load('minCuad_data1.mat')


x=linspace(0,1,100);


y=regresion_minimos(xi,yi,x);
clf
hold on
%Los puntos originales
plot(xi,yi,'r*')
%La recta de regresion
plot(x,y)
