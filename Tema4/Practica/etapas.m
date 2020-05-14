function ki=etapas(f,A,c,x0,y0,h)

yLen = length(y0);
nRows = length(A);

k = zeros(yLen,nRows);

for j=1:nRows
    acum=0;
    for g=1:j-1
       acum=acum+A(j,g)*k(:,g);
    end
    k(:,j)=f(x0+c(j)*h, y0(:)+h*acum);
end

ki = k;

end