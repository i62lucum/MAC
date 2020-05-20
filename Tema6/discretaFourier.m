function c=discretaFourier(x,N)

c = zeros(N*2+1,1);

count = 1;

lenX = length(x);


eAux=exp(1i*2*pi/lenX);
for n=-N:N
    for k=1:length(x)
        w=eAux^(-(k-1)*n);
        c(count)=c(count)+x(k)*w;
    end
    count = count + 1;
end
c=c/lenX;
end