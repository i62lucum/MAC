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

%La tarea consiste en:
% 1. Obtener los coeficientes de Fourier y observar que hay coeficientes
% que no aportan mucho (de modulo pequeño) y que corresponden al ruido
% 2. Poner a 0 los coeficientes de Fourier correspondiente al ruido
% (filtrar la señal)
% 3. Obtener la señal asociada a los nuevos coeficientes y comprobar que
% corresponde a la señal exacta

plot(ax1,t,exacta)
plot(ax2,t(1:50),exacta(1:50))


