%Para crear una ventana ajustado al tamanyo de pantalla
figure('Units', 'Normalized', 'OuterPosition', [0 0 1 1])

%Parametros
N=30;%Numero de ondas, coeficientes = N*2 debido a la simetria.
step=2;%Para la animacion, incremento de los coeficientes
T=6;%Periodo de la funcion
funcion = @senyal;

%Se extraen los coeficientes de Fourier
c=fourier(funcion,N,T);

%Se dibujan las fases
subplot(3,1,2);
fases(c);

%Se dibujan las amplitudes
subplot(3,1,3);
amplitudes(c);

subplot(3,1,1);

pause('on');
%Se incrementa paulatinamente la n utilizada y se muestra.
for n=2:step:N
    cla;
    suma_parcial(@senyal,c,n,T);
    pause(2);
end
