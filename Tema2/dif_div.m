function A=dif_div(xi,yi)

long=length(xi);

A=zeros(long,long);


A(:,1)=yi;

%Recorre las columnas
for j=2:long
   %Recorre las filas
   for i=1:(long-j+1)
       
       A(i,j)=(A(i+1,j-1)-A(i,j-1))/(xi(j+i-1)-xi(i));
   end
end

end