%Calcula los coeficientes de Fourier.
%   f: La funcion a analizar
%   N: El numero de ondas.
%   T: El periodo por el cual se dividirá cada una de las frecuencias.
function c=fourier(f, N, T)


nCoef = N*2+1;
c = zeros(nCoef,1);
i = 1;
umbral = 10^-9;

for n=-N:N
    %Se obtiene la funcion a integrar
    int = @(t) f(t).*exp(-2i.*pi.*n.*t./T);
    %Se integra y se obtiene el coeficiente
    c(i) = integral(int,0,T)/T;
    %Si es menor que un umbral, es 0.
    if (abs(c(i))<umbral)
        c(i) = 0.0 + 0.0i;
    end
    i=i+1;
end


end