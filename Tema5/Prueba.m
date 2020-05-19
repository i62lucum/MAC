

f = @(x) 5*sin(2*pi*x);

c=fourier(f,3);

suma_parcial(f,c,2);