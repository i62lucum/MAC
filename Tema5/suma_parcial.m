function suma_parcial(f,c,N,T)

nValues = 500;
t=linspace(-6,6,nValues);
yFourier = zeros(nValues,1);

yReal = f(t);

cero = round(length(c)/2);

for i=1:nValues
    for n=-N:N
        yFourier(i)=yFourier(i)+c(cero+n)*exp(2i*pi*n*t(i)/T);
    end
end

hold on
plot(t,yReal)


plot(t,yFourier)

end