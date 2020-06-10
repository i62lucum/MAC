%Realiza la transformada inversa de coseno discreta(ITCD), en 2 dimensiones para A.
function newA=ITCD2D(A)
    
N = size(A);
%Se obtiene el orden de A
N = N(1);

%Se obtiene C 
C = getC(N);

%Se obtiene la transformada inversa de A.
newA = C.'*A*C;


end