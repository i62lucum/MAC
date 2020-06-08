function A=vandermondeF(N)

%Se reserva espacio para la matriz
A=ones(N,N);
%El vector de Wn que servirá para acelerar el proceso.
wN=zeros(N-1,1);

%Se rellena el vector de Wn.
wN(1)= exp(1i*2*pi/N);
for i=2:N-1
    wN(i) = wN(i-1)*wN(1);
end

%La primera fila y columna son unos, luego, a partir del segundo elemento
%de la diagonal hacia abajo se obtienen multiplicando los anteriores por
%los Wn correspondientes, de la diagonal hacia la derecha son simetricos
%por lo que se obtienen de los calculados previamente.
for i=2:N
    A(i:N,i)= A(i:N,i-1).*wN(i-1:N-1);
    A(i,i+1:N)=A(i+1:N,i);
end


end