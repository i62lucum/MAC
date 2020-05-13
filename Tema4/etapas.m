function ki=etapas(f,A,c,x0,y0,h)

nFunc = length(f);
nRows = length(A);

k = zeros(nFunc,nRows);

if nFunc == 1
    func = f;
    for j=1:nRows
        acum=0;
        for g=1:j-1
           acum=acum+A(j,g)*k(1,g);
        end
        k(1,j)=func(x0+c(j)*h, y0(1)+h*acum);
    end
else
    %Por cada funcion hay una serie de Ki
    for i=1:nFunc
        %Se extrae la funcion
        func = f{i};
        %Por cada fila de la matriz A hay una Ki
        for j=1:nRows
            acum=0;
            %Se acumulan las anteriores Ki multiplicados por sus
            %respectivos valores en A.
            for g=1:j-1
               acum=acum+A(j,g)*k(i,g);
            end
            k(i,j)=func(x0+c(j)*h, y0(i)+h*acum);
        end
    end
end

ki = k;

end