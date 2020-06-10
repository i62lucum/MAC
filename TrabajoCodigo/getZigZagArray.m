%Crea un array recorriendo la matriz cuadrada A en zigzag, llegando hasta
%el último elemento no nulo.
function a=getZigZagArray(A)

N = size(A);
%Orden de la matriz
N = N(1);

%Vector auxiliar del recorrido.
aux = zeros(1,N*N);


i=1;
j=1;
actual=0;

count = 1;

%Tamanyo maximo del vector
while i*j<N*N+1
    %Si actual es 0 recorre la matriz hacia arriba a la derecha
    if actual==0
        aux(count)= A(i,j);
        count = count + 1;
        while i~=1 && j~=N
            j = j + 1;
            i = i - 1;
            aux(count)= A(i,j);
            count = count + 1;
        end
        if j ~= N 
            j = j + 1;
        else
            i = i + 1;
        end   
        actual=1;
    %Si actual es 1 se recorre hacia abajo a la izquierda
    else
        aux(count)= A(i,j);
        count = count + 1;
        while j~=1 && i~=N
            j = j - 1;
            i = i + 1;
            aux(count)= A(i,j);
            count = count + 1;
        end
        if i ~= N
            i = i + 1;
        else
            j = j + 1;
        end
        actual = 0;
    end

end

%Se obtiene el ultimo elemento no nulo.
indexLast = find(aux ~= 0, 1, 'last');
if isempty(indexLast) 
    indexLast = N*N;
end

a = aux(1:indexLast);

end