%Evalua la funcion a trozos definidos por las rectas de cada par de puntos (xi,yi) y
%(xi+1,yi+1):
%   xi: abscisas de los puntos 
%   yi: ordenadas de los puntos
%   x: abscisa de los puntos a evaluar
%Devuelve:
%   y: la evaluacion de los puntos.
function y=spline_lineal(xi,yi,x)

%Numero de puntos a evaluar
len = length(x);

%Imagenes de los puntos a evaluar
y = zeros(len,1);

%Se obtienen los coeficientes
[ai,bi] = coef_spline_lineal(xi,yi);

% Numero de intervalos
n = length(xi);

%Por cada punto a evaluar
for i=1:len
    
    j = 2;
    %Si es mayor que el extremo superior del intervalo j-1, pertenece a ese
    %intervalo
    while(j~=n && x(i)>= xi(j))
       j = j + 1;
    end
    %Se evalua x con su funcion/intervalo correspondiente.
    y(i) = ai(j-1)*x(i) + bi(j-1);
    
    
end

end