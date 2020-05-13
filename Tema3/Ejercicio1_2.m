
puntos=100;
x=linspace(-5,5,puntos);

y=sin(x);

dy1=dprogresiva(x,y);
dy2=dregresiva(x,y);
dy3=dcentrada(x,y);
dy4=cos(x);




%Descomentar para mostrar, se recomienda solo descomentar una de las tres

%Progresiva
%plot(x(1:puntos-1),dy1,'--');

%Regresiva
%plot(x(2:puntos),dy2,'--');

%Centrada-> Sale coincidente
plot(x(2:puntos-1),dy3,'--');



plot(x,dy4);