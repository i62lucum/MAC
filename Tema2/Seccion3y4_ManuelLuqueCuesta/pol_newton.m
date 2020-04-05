function y=pol_newton(xi,yi,x)



A=dif_div(xi,yi);


y=zeros(length(x),1);

y(:)=A(1,1);

grado=length(xi)-1;
aux=ones(grado,1);

for i=1:length(x)
    
    %Se obtiene la evaluacion del polinomio sin sus coeficientes
    aux(1)=(x(i)-xi(1));
    for j=2:grado
        aux(j)=aux(j-1)*(x(i)-xi(j));
    end
    %Se multiplica cada evaluacion por su respectivo coeficiente
    for j=1:grado
        y(i)=y(i)+A(1,j+1)*aux(j);
    end
    
end






end