function y=pol_lagrange(xi,yi,x)


%Vector que almacena la interpolacion para los valores del vector "x"
y=zeros(length(x),1);

%Se evalua con el polinomio de lagrange, que es la conjuncion de los
%n+1 polinomios (Li) multiplicados por sus respectivas yi.
for j=1:length(yi)
    y=y+yi(j)*base_lagrange(xi,x,j);
end    
    
%end

    


end