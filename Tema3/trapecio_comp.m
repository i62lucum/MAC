function I=trapecio_comp(f,a,b,N)

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
    area=(f(xAct)+f(xSig))/2*h;
    xAct=xSig;
    I=I+area;
end


end