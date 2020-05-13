%Obtiene los coeficientes del polinomio mediante el método de minimos cuadrados:
%   x: abscisa de los puntos iniciales
%   y: ordenada de los puntos iniciales
%   grado: del polinomio a construir

function a=minimos_cuadrados(x, y, grado)

tam=size(y);
%Se transforma a vector columna si es necesario
if(tam(1)<tam(2))
   y=y.';
end

%Devuelve la matriz de Vandermonde con dimensiones (n+1,grado+1)
M=Vandermonde(x,grado);

Mt=M.';

%Minimos cuadrados
a=(Mt*M)\(Mt*y);

end