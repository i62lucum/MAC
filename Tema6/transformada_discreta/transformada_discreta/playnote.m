function playnote(t,freq,Fs,varargin)
% Funcion para dibujar y reproducir un sonido de una determinada frecuencia
% Fs = frecuencia de muestreo
% t = tiempos correspondientes al muestreo 0:1/Fs:T-1/Fs
% freq = frecuencia del sonido que queremos representar y= sin(2*pi*freq*t)
% argumentos opcionales = los ejes donde queremos pintar

if (nargin==3)
    ax1=subplot(2,1,1);
    ax2=subplot(2,1,2);
else
    ax1=varargin{1};
    ax2=varargin{2};
    cla(ax1);
    cla(ax2);

end
y= sin(2*pi*freq*t);

axes(ax1);
plot(t,y,'-b');
title(sprintf('freq=%g',freq));
xlabel('t (s)');
axis([0 0.1 -1 1]);

%
% limit to first 0.015 s
%
axes(ax2);
plot(t,y,'-b');
axis([0 0.015 -1 1]);
xlabel('t (s)');
title(sprintf('freq=%g',freq));

%sound(y,Fs);
onda = audioplayer(y, Fs);
play(onda)

% Se debe esperar un tiempo suficiente para que acabe el sonido de
% reproducirse
pause(t(end)+0.5)
