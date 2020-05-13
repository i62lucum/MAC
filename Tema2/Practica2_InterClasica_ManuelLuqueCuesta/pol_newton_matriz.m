function [y,A]=pol_newton_matriz(xi,yi,x,A_Ant)


if ~exist('A_Ant','var') == 1
    A=dif_div_matriz(xi,yi);
    longAnt = 0;
else
    A=dif_div_matriz(xi,yi,A_Ant);
    longAnt = length(A_Ant);
end



y=zeros(length(x),1);

y(:)=A(1,1);

grado=length(xi)-1;
eval=ones(grado,1);


for i=1:length(x)

    %Se obtiene la evaluacion del polinomio sin sus coeficientes
    eval(1)=(x(i)-xi(1));
    for j=2:grado
        eval(j)=eval(j-1)*(x(i)-xi(j));
    end
    %Se multiplica cada evaluacion por su respectivo coeficiente
    for j=longAnt+1:grado
        y(i)=y(i)+A(1,j+1)*eval(j);
    end
end


end