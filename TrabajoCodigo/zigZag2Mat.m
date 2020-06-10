%Transforma un array obtenido mediante zigzag a matriz de orden N.
function A = zigZag2Mat(zigArray,N)

%Se crea A.
A=double(zeros(N));

len = length(zigArray);


i=1;
j=1;
actual=0;

count = 1;

%Se recorre hasta el final del array.
while true
    %Si actual es 0 se recorre hacia arriba a la derecha
    if actual==0
        A(i,j) = zigArray(count);
        count = count + 1;
        if count > len
           return
        end
        while i~=1 && j~=N
            j = j + 1;
            i = i - 1;
            A(i,j) = zigArray(count);
            count = count + 1;
            if count > len 
               return
            end
        end
        if j ~= N 
            j = j + 1;
        else
            i = i + 1;
        end   
        actual=1;
    %Si actual es 1 se recorre hacia abajo a la izquierda.
    else
        A(i,j) = zigArray(count);
        count = count + 1;
        if count > len
           return
        end
        while j~=1 && i~=N
            j = j - 1;
            i = i + 1;
            A(i,j) = zigArray(count);
            count = count + 1;
            if count > len
               return
            end
        end
        if i ~= N
            i = i + 1;
        else
            j = j + 1;
        end
        actual = 0;
    end

end



end