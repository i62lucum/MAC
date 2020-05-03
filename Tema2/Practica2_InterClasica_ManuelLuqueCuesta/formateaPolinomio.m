function polinomio=formateaPolinomio(pol,xi)

len = length(pol);


polin = strings(len,1);
polin(1) = num2str(pol(1));


for i=2:len
    if pol(i)>0
        polin(i)=strcat(' + ', num2str(pol(i)));
    else
        polin(i)=strcat(' - ', num2str(abs(pol(i))));
    end
    for j=2:i
        polin(i)=strcat(polin(i),'(x-',num2str(xi(j-1)),')');
    end
end
polinomio = polin(1);
for i=2:len
    polinomio = strcat(polinomio, polin(i));
end


end