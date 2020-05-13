function I=simpson_comp(f,a,b,N)

if a > b
   aux=a;
   a=b;
   b=aux;
end

h=(b-a)/N;
I=0;

xAct=a;
for i=1:N
    xSig=xAct+h;
    medio=xAct+h/2;
    area=(xSig-xAct)/2*(1/3*f(xAct)+4/3*f(medio)+1/3*f(xSig));
    xAct=xSig;
    I=I+area;
end


end