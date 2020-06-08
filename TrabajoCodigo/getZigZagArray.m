function a=getZigZagArray(A)

N = size(A);
N = N(1);

aux = zeros(1,N*N);

i=1;
j=1;
actual=0;

count = 1;

while i*j<N*N+1
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

indexLast = find(aux ~= 0, 1, 'last');
if isempty(indexLast) 
    indexLast = N*N;
end

a = aux(1:indexLast);

end