function [ai,bi,ci,di]=coef_spline_cubico(xi,yi)



%Numero de funciones/intervalos
n = length(xi)-1;

sizeX=size(xi);
%Para facilitar las operaciones matriciales de matlab, se transforman a
%vector columna
if(sizeX(1)<sizeX(2))
    xi=xi.';
    yi=yi.';
end


%COEFICIENTE Di
di=yi;

%Se obtienen las distancias entre xi como hi
hi=xi(2:n+1)-xi(1:n);
%Se obtiene la variable Deltai
deltas=(yi(2:n+1)-yi(1:n))./hi;


%El termino independiente del sistema lineal
indep = deltas(2:n)-deltas(1:n-1);


%Diagonal principal
matrix = diag(2/3*(hi(2:n)+hi(1:(n-1))));
%Se anyade la diagonal inferior
matrix = matrix + diag(1/3*hi(2:n-1),-1);
%Se anyade la diagonal superior
matrix = matrix + diag(1/3*hi(2:n-1),1);

%COEFICIENTE bi
%Utilizando el concepto de frontera natural bi(1)=bi(n+1) = 0
bi = zeros(n+1,1);
%El resto de bi se calcula mediante un sistema lineal
bi(2:n)=matrix\(indep);

%COEFICIENTE ai
ai=(bi(2:n+1)-bi(1:n))./(3*hi);

%COEFICIENTE ci
ci=deltas-hi.*(2*bi(1:n)+bi(2:n+1))/3;


end