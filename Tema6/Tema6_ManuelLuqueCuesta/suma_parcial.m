%Dibuja la aproximacion de una funcion f, mediante sus coeficientes de
%fourier c.
%   f: funcion
%   c: coeficientes
%   N: numero de coeficientes a utilizar del total
%   T: periodo
function suma_parcial(f,c,N,T)
%Numero de valores
nValues = 500;
%Rango entre el que se quiere observar
t=linspace(-6,6,nValues);
yFourier = zeros(nValues,1);
yReal = f(t);

%La posicion del 0 en coeficientes
cero = round(length(c)/2);

%Por cada valor se obtiene su aproximacion
for i=1:nValues
    for n=-N:N
        yFourier(i)=yFourier(i)+c(cero+n)*exp(2i*pi*n*t(i)/T);
    end
end

hold on
plot(t,yReal)


plot(t,yFourier)

end