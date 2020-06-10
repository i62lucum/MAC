%Obtiene la matriz C asociada a la transformada del coseno.
function A=getC(N)

%Se reserva espacio para la matriz, la primera fila es todo 1.
A=ones(N,N);

%Theta
ang = pi/(2*N);

%Se construye la primera columna.
A(2:N,1) = (1:N-1)*ang;

%Las columnas siguientes son la multiplicación de la primera por (i-1)*2+1
for i=2:N
    A(2:N,i) = A(2:N,1)*((i-1)*2+1);
end

%Toda la matriz esta multiplicada por sqrt(2)/sqrt(N), es una de las
%transformadas del coseno.
A(2:N,:)= (sqrt(2)/sqrt(N))*(cos(A(2:N, :)));
%Salvo la primera fila que solo esta multiplicado por sqrt(2).
A(1,:) = A(1,:)/sqrt(N);


end