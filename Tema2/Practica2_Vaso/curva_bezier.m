function [x,y]=curva_bezier(xi,yi,t)


puntos=[xi,yi];
%Puntos para dibujar la curva
nPuntosGraf=length(t);


N=length(xi)-1;
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

x=puntosGraf(:,1);
y=puntosGraf(:,2);


end