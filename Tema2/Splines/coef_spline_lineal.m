function [ai,bi]=coef_spline_lineal(xi,yi)

%Numero de funciones/intervalos
n = length(xi)-1;

%Coeficientes
ai = zeros(n,1);
bi = zeros(n,1);

%Por cada par de puntos
for i=1:n
    %Se extraen los valores para una mayor comprension
    x1 = xi(i);
    x2 = xi(i+1);
    y1 = yi(i);
    y2 = yi(i+1);
    %La pendiente
    ai(i) = (y2-y1)/(x2-x1);
    %El termino independiente
    bi(i) = ai(i)*(-x1) + y1;
end


end