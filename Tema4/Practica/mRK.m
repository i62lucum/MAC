function [xk,yk]=mRK(f,A,b,c,x0,y0,h,k)

lenY = length(y0);
nRows = length(A);



yk = zeros(lenY, k+1);
xk = zeros(k+1,1);

xk(1)=x0;

yk(:,1)=y0(1);
for j=1:k
   ki=etapas(f,A,c,xk(j),yk(:,j),h);
   xk(j+1)=xk(j)+h;
   acum=0;
   for g=1:nRows
       acum=acum+ki(:,g)*b(g);
   end
   yk(:,j+1)=yk(:,j)+h*acum;
end



end