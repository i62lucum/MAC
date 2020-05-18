%f es una función.
%x0 es el valor inicial
%y0 es la imagen del valor inicial para cada nodo
%h es el tamanyo del paso
%k es el numero de pasos
function [xk,yk]=mHeun(f,x0,y0,h,k)

lenY = length(y0);

yk = zeros(lenY, k+1);
xk = zeros(k+1,1);

xk(1)=x0;


yk(:,1)=y0;
for j=1:k
   xk(j+1)=xk(j)+h;
   yk_Heuler=yk(:,j)+h*f(xk(j),yk(:,j));
   yk(:,j+1)=yk(:,j)+h*(f(xk(j),yk(:,j))+f(xk(j+1),yk_Heuler))/2;
end

end