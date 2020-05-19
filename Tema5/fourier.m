function c=fourier(f, N, T)



nCoef = N*2+1;
c = zeros(nCoef,1);
i = 1;
umbral = 10^-9;

for n=-N:N
    

    int = @(t) f(t).*exp(-2i.*pi.*n.*t./T);
    c(i) = integral(int,0,T)/T;
    if (abs(c(i))<umbral)
        c(i) = 0.0 + 0.0i;
    end
    i=i+1;
end





end