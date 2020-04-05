function y=base_lagrange(xi,x,j)

long=length(x);

y=ones(long,1);

grado=length(xi)-1;


%Se recorre el vector de puntos a evaluar

for i=1:long
   
    %Se obtienen los n+1 polinomios, siendo n el grado y evaluandolos con la
    %x actual.
    for k=1:j-1(grado+1)
        %Se acumula sucesivamente mediante el producto, de tal forma
        %que al final se obtenga la evaluacion del polinomio L(x)j
        y(i)=y(i)*(x(i)-xi(k))/(xi(j)-xi(k));
    end
    for k=j+1:(grado+1)
        %Se acumula sucesivamente mediante el producto, de tal forma
        %que al final se obtenga la evaluacion del polinomio L(x)j
        y(i)=y(i)*(x(i)-xi(k))/(xi(j)-xi(k));
    end
   
end



end