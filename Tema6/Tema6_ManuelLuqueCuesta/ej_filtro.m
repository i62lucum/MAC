close all

%Cargamos los datos
load filtro

%Eso nos proporciona las variables: 
% ruido = señal perturbada con ruido
% exacta = señal exacta para comparar
% T = tiempo total
% Fs = frecuencia de muestreo


%Pintamos la señal con ruido
t = 0:1.0/Fs:T-1.0/Fs;
ax1 = subplot(2,1,1);
ax2 = subplot(2,1,2);
plot(ax1,t,ruido)
plot(ax2,t(1:50),ruido(1:50))

pause

%La tarea consiste en:
% 1. Obtener los coeficientes de Fourier y observar que hay coeficientes
% que no aportan mucho (de modulo pequeño) y que corresponden al ruido
% 2. Poner a 0 los coeficientes de Fourier correspondiente al ruido
% (filtrar la señal)
% 3. Obtener la señal asociada a los nuevos coeficientes y comprobar que
% corresponde a la señal exacta

%Se obtienen los coefientes 
beta = fft(ruido);
N = length(beta);
umbral = N/5;

%Se reordenan para que esten de acuerdo a su frecuencia
reorderedBeta = fftshift(beta);

subplot(2,1,1);
cla;
%El rango de valores de la frecuencia
aux = -N/2:1:N/2-1;

%Se muestra los coeficientes reordenados
plot(aux, abs(reorderedBeta),'ro');
hold on
for i=1:N
    actualI=i-500;
    plot([actualI actualI],[0 abs(reorderedBeta(i))],'k')
end

subplot(2,1,2);
cla;

plot(aux,abs(reorderedBeta));
pause

%Se elimina el ruido tanto de los ordenados como los obtenidos por fft
for i=1:N
    if abs(reorderedBeta(i))<umbral
        reorderedBeta(i)=0;
    end
    if abs(beta(i)) < umbral
        beta(i)=0;
    end
end

%Se dividen entre N para obtener el verdadero valor de amplitud.
reorderedBeta = reorderedBeta/N;
subplot(2,1,1);
cla;
aux = -N/2:1:N/2-1;
plot(aux, abs(reorderedBeta),'ro');
hold on
for i=1:N
    actualI=i-500;
    plot([actualI actualI],[0 abs(reorderedBeta(i))],'k')
end

subplot(2,1,2);
cla;

plot(aux,abs(reorderedBeta));
pause

x=ifft(beta);

subplot(2,1,1);
cla;
plot(t,exacta);
hold on;
plot(t,x);

subplot(2,1,2);
cla;

plot(t(1:50),exacta(1:50));
hold on;
plot(t(1:50),x(1:50));



