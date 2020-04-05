function y=interpolacion(X0,Y0,x)

M=Vandermonde(X0);

tam=size(Y0);

%Se transforma a vector columna si es necesario
if(tam(1)<tam(2))
   Y0=Y0.';
end

%Se resuelve la ecuación
ecu=M\Y0;
%Se invierte el orden de los elementos para evaluar el polinomio mediante
%polyval
ecu=flip(ecu);

%Se reserva memoria para Y
long=length(x);
y=ones(long,1);

for i=1:long
    y(i)=polyval(ecu,x(i));
end

plot(x,y);
end