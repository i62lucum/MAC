%Realiza una regresion de minimos cuadrados dados:
%   xi: abscisa de los puntos iniciales
%   yi: ordenada de los puntos iniciales
%   x: puntos de los que se quiere obtener la imagen mediante regresion
%   grado: del polinomio a construir( es opcional, si no se introduce, se tomará la
%   regresión lineal)
function y=regresion_minimos(xi,yi,x,grado)

%Comprueba si el grado ha sido proporcionado, si no, se tomara grado 1.
if ~(exist('grado','var') == 1)
    grado=1;
end

%Se llama a la funcion de minimos cuadrados que devuelve los coeficientes
a=minimos_cuadrados(xi,yi,grado);

%Se crean estructuras de datos para almacenar la informacion
y=zeros(length(x), 1);
%Estructura para almacenar el resultado de los polinomios de manera mas
%eficiente
aux=ones(length(a),1);

for i=1:length(x)
    
    %Se obtiene el valor de cada monomio sin su coeficiente, de manera 
    %x^3=x^2*x
    aux(1)=1;
    for j=2:length(a)
        aux(j)=x(i)*aux(j-1);
    end
    %Se conjuntan los coeficientes y los respectivos valores de x(i),
    %obteniendose un y(i) correspondiente.
    y(i)=a(1);
    for j=2:length(a)
        y(i)=y(i)+a(j)*aux(j);
    end
end


end