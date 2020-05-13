%PARAMETROS PARA EL EJEMPLO CON VARIAS FUNCIONES
C = 10; %Constante de la primera funcion
x0 = 1; %Valor inicial de x0
h = 0.1; %Tamanyo del paso
k = 50; %Numero de pasos a dar
func = @(x,y) y;%La derivada de Ce^x
funcReal = @(x) C*exp(x);%La funcion real Ce^x



y0 = funcReal(x0);


x = linspace(x0, x0+k*h, k+1);
y = funcReal(x);

[xkEuler,ykEuler]=mEuler(func, x0, y0, h, k);
[xkHeun,ykHeun]=mHeun(func, x0, y0, h, k);


errorHeun=sum(abs(y-ykHeun));
errorEuler=sum(abs(y-ykEuler));


fprintf("Sumatorio de errores cometidos para h=%f de x0=1 a xk=5:\n\tEuler: %f\n\tHeun: %f\n",h,errorEuler, errorHeun)

h = 0.2;
k = 25;
x = linspace(x0, x0+k*h, k+1);
y = funcReal(x);

[xkEuler,ykEuler]=mEuler(func, x0, y0, h, k);
[xkHeun,ykHeun]=mHeun(func, x0, y0, h, k);


errorHeun=sum(abs(y-ykHeun));
errorEuler=sum(abs(y-ykEuler));

fprintf("Sumatorio de errores cometidos para h=%f y x0=1 a xk=5:\n\tEuler: %f\n\tHeun: %f\n",h,errorEuler, errorHeun);
