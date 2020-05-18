function ki=etapas(f,A,c,x0,y0,h)

yLen = length(y0);
nRows = length(A);

k = zeros(yLen,nRows);

for i=1:nRows
    acum=zeros(yLen,1);
    for j=1:i-1
       acum=acum+A(i,j)*k(:,j);
    end
    k(:,i)=f(x0+c(i)*h, y0+h*acum);
end

ki = k;

end