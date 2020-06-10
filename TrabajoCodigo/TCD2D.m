%Realiza la transformada de coseno discreta(TCD), en 2 dimensiones para A.
function newA=TCD2D(A)
    
N = size(A);
%Orden de la matriz
N = N(1);

%Se obtiene C de orden N.
C = getC(N);

%Se obtiene la transformada del coseno.
newA = C*A*C.';


end