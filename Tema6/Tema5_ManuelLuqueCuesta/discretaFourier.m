function c=discretaFourier(x,N)

%Se reserva espacio
c = zeros(N*2+1,1);

lenX = length(x);

count = 1;

eAux=exp(1i*2*pi/lenX);

%Por cada uno de los coeficientes
for n=-N:N
    %Para cada valor de x
    for k=1:length(x)
        %Se obtiene el wn correspondiente
        w=eAux^(-(k-1)*n);
        c(count)=c(count)+x(k)*w;
    end
    count = count + 1;
end
c=c/lenX;
end