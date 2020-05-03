function A=dif_div_matriz(xi,yi,A_anterior)

long=length(xi);

if ~exist('A_anterior','var') == 1
    longAnt=0;
    A=zeros(long,long);
else
    longAnt=length(A_anterior);
    A=zeros(long,long);
    A(1:longAnt,1:longAnt)=A_anterior;
end

%Se anyaden los nuevos yi
A(longAnt+1:long,1) = yi(longAnt+1:long);

%Recorre las columnas
for j=2:long
   %Recorre las filas
   if longAnt~=0 && longAnt-j+2~=0
       for i=longAnt-j+2:(long+1-j)
           A(i,j)=(A(i+1,j-1)-A(i,j-1))/(xi(j+i-1)-xi(i));
       end
   else
      for i=1:(long-j+1)
           A(i,j)=(A(i+1,j-1)-A(i,j-1))/(xi(j+i-1)-xi(i));
      end
   end   
end


end