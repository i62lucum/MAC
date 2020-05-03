%Funcion que realiza una curva de Bezier, dados N+1 puntos introducidos
%graficamente.
%   N: numero de intervalos.
function curva_bezier(N)

clf
axis equal
axis([0 4 0 4])
hold on

%Puntos para dibujar la curva
nPuntosGraf=100;

text(0.8, 3.5,'Haga click para seleccionar los puntos','Color',[0 0 0.8]);

%Vector de puntos recogidos del usuario
puntos=zeros(N+1,2);

%Se recogen los puntos
for i=1:N+1
    puntos(i,:) = ginput(1);
    plot(puntos(i,1),puntos(i,2),'ro');
end

t=linspace(0,1,nPuntosGraf);


B=zeros(N+1,2);


puntosGraf=zeros(nPuntosGraf,2);

for i=1:N+1
    k=i-1;
    
    %Para mas eficiencia se realiza este calculo
    B(i,:)=nchoosek(N,k)*(puntos(i,:));
    
    %Por cada punto se calcula su equivalente
    for j=1:length(t)
        puntosGraf(j,:)=puntosGraf(j,:)+B(i,:)*(1-t(j))^(N-k)*t(j)^k;
    end
    
end


plot(puntosGraf(:,1),puntosGraf(:,2));


end