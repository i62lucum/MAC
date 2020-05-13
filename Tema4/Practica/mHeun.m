%f es un array de cells de funciones o una función simple.
%x0 es el valor inicial
%y0 es la imagen del valor inicial para cada funcion
%h es el tamanyo del paso
%k es el numero de pasos
function [xk,yk]=mHeun(f,x0,y0,h,k)

lenY = length(y0);
lenF = length(f);

if lenF ~= 1 && lenF ~= lenY
   disp("Error: el numero de funciones ha de coincidir con el numero valores de y0");
   return; 
end

yk = zeros(lenY, k+1);
xk = zeros(k+1,1);

xk(1)=x0;

if lenY == 1
    func = f;
    yk(1,1)=y0(1);
    for j=1:k
       xk(j+1)=xk(j)+h;
       yk_Heuler=yk(1,j)+h*func(xk(j),yk(1,j));
       yk(1,j+1)=yk(1,j)+h*(func(xk(j),yk(1,j))+yk_Heuler)/2;
    end
else
    for i=1:lenY
        yk(i,1)=y0(i);
        func = f{i};
        for j=1:k
           xk(j+1)=xk(j)+h;
           yk_Heuler=yk(i,j)+h*func(xk(j),yk(i,j));
           yk(i,j+1)=yk(i,j)+h*(func(xk(j),yk(i,j))+func(xk(j),yk_Heuler))/2;
        end

    end
end

end