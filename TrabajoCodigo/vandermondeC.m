function A=vandermondeC(N)

%Se reserva espacio para la matriz
A=ones(N,N);

ang = pi/(2*N);

A(2:N,1) = (1:N-1)*ang;

for i=2:N
    A(2:N,i) = A(2:N,1)*((i-1)*2+1);
end

A(2:N,:)= (sqrt(2)/sqrt(N))*(cos(A(2:N, :)));
A(1,:) = A(1,:)/sqrt(N);


end