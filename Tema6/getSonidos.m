function sonidos=getSonidos(onda)


lenOnda=length(onda);
separation=50;
count=0;
first=1;
last=0;
margen=0.1;
cero = false;
ceroCount = 0;

j=1;
for i=1:lenOnda
    if cero 
        if onda(i)<margen
            count = count +1;
            ceroCount = ceroCount+1;
        else
            cero=false;
            if ceroCount > separation
                first=i;
            end
        end
        if count == separation
            sonidos(j)=last;
            j=j+1;
        end
    else
        if onda(i)<margen
            if 
        end         
    end

end



end