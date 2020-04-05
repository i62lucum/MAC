%Evalua la funcion a trozos definidos por las funciones cubicas de cada par de puntos (xi,yi) y
%(xi+1,yi+1):
%   xi: abscisas de los puntos 
%   yi: ordenadas de los puntos
%   x: abscisa de los puntos a evaluar
function y=spline_cubico(xi,yi,x)

%Numero de puntos a evaluar
len = length(x);

%Imagenes de los puntos a evaluar
y = zeros(len,1);

%Se obtienen los coeficientes
[ai,bi,ci,di] = coef_spline_cubico(xi,yi);

%Numero de intervalos
n = length(xi);

%Vector auxiliar
valor = zeros(3,1);

%Para cada punto a evaluar
for i=1:len
    
    j = 2;
    %Si es mayor que el extremo superior del intervalo j-1, pertenece a ese
    %intervalo
    while(j~=n && x(i)>= xi(j))
       j = j + 1;
    end
    %Se obtiene el valor y sus pontencias
    valor(1)=(x(i)-xi(j-1));
    valor(2)=valor(1)*valor(1);
    valor(3)=valor(2)*valor(1);
    
    %Se multiplica cada valor por su coeficiente y se obtiene la evaluacion
    y(i) = ai(j-1)*valor(3) + bi(j-1)*valor(2) + ci(j-1)*valor(1) + di(j-1);
    
    
end

end