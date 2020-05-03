puntos=100;
x=linspace(-5,5,puntos);

y=sin(x);

dy1=dprogresiva(x,y);
dy2=dregresiva(x,y);
dy3=dcentrada(x,y);
dy4=cos(x);
dy4=dy4.';


%Calcula el error medio cuadrático
errorProgresiva = immse(dy1,dy4(1:puntos-1))
errorRegresiva = immse(dy2,dy4(2:puntos))
errorCentrada = immse(dy3,dy4(2:puntos-1))