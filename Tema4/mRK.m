function [xk,yk]=mRK(f,A,b,c,x0,y0,h,k)

lenY = length(y0);
lenF = length(f);
nRows = length(A);

if lenF ~= 1 && lenF ~= lenY
   disp("Error: el numero de funciones ha de coincidir con el numero valores de y0");
   return; 
end


yk = zeros(lenY, k+1);
xk = zeros(k+1,1);

xk(1)=x0;

if lenY == 1
    yk(1,1)=y0(1);
    for j=1:k
       ki=etapas(f,A,c,xk(j),yk(1,j),h);
       xk(j+1)=xk(j)+h;
       acum=0;
       for g=1:nRows
           acum=acum+ki(1,g)*b(g);
       end
       yk(1,j+1)=yk(1,j)+h*acum;
    end
else
    yk(:,1)=y0(:);
    for j=1:k
        ki=etapas(f,A,c,xk(j),yk(:,j),h);
        for i=1:lenY
           xk(j+1)=xk(j)+h;
           acum=0;
           for g=1:nRows
               acum=acum+ki(i,g)*b(g);
           end
           yk(i,j+1)=yk(i,j)+h*acum;
        end
    end
end



end