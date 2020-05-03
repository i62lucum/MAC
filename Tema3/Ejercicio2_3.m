
%Modificar los valores para obtener diferentes resultados
N=100;
a=0;
b=5;
funcion = @(x) x^3+8*x-sin(x);
integralFuncion = @(x) x^4/4+4*x^2+cos(x);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I=integralFuncion(b)-integralFuncion(a);
I_simpson=simpson_comp(funcion,a,b,N);
I_trapecio=trapecio_comp(funcion,a,b,N);

errorSimpson=abs(I_simpson-I);
errorTrapecio=abs(I_trapecio-I);

fprintf("Errores cometidos para N=%i:\n-----------------------------\n",N)
fprintf("\tTrapecio: %f\n\tSimpson: %f\n",errorTrapecio,errorSimpson);


