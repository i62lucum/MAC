
N=input('¿Cuantos puntos desea?: ');

clf
axis equal
axis([0 4 0 4])
hold on

text(0.8, 3.5,'Haga click para seleccionar los puntos','Color',[0 0 0.8]);

aux=zeros(N,2);

for i=1:N
    aux(i,:) = ginput(1);
    plot(aux(i,1),aux(i,2),'ro');
end

xi=aux(:,1);
yi=aux(:,2);

t=linspace(0,1,100);

[x,y]=curva_spline(xi,yi,t);

plot(x,y);

