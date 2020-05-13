%Funcion que obtiene los nodos de chebyshev
%   a: extremo inferior del intervalo
%   b: extremo superior del intervalo
%   N: numero de puntos a obtener en ese intervalo
function xk=nodos_chebyshev(a,b,N)

if(a>b)
   aux=a;
   a=b;
   b=aux;
end


%Como los puntos de la x son iguales si la semicircunferencia se encontrara
%en la parte positiva que en la negativa, se ha seleccionado la negativa
%para que los puntos salgan en orden directo y no inverso.
t=linspace(pi,2*pi,N);

rang=b-a;

%Se suma 1 y se divide por dos, para trasladar los puntos del (-1,1) al
%(0,1) y poder ajustarlos a un rango.
xk=(cos(t)+1)/2*rang+a;




end