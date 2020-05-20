
close all
scrsz = get(0,'ScreenSize');
fig=figure('Position',[1 scrsz(4) scrsz(3) scrsz(4)]);


ax1=subplot(5,1,1,'Visible','off');
ax2=subplot(5,1,[2 5]);



descr = {'Supongamos la señal y=sin(2*pi*f0*t) durante T=2s','de frecuencia f0, es decir, f0 ciclos por segundo',...
    'por ejemplo f0=3Hz serían 3 ciclos por segundo y un periodo 1/3'};

axes(ax1); % sets ax1 to current axes

set(gca,'DefaulttextFontSize',18);
txt=text(.025,0.8,descr);


axes(ax2);




T=2;


f0=3;
t=linspace(0,T,500);
plot(t,sin(2*pi*f0*t))
pause
clc
descr = {'La frecuencia de muestreo fs indica cada cuanto tomamos una señal',
    'Por ejemplo fs=8 indica que tomamos 8 muestras cada segundo',
    'o equivalentemente, cada ts=1/fs=1/8'};
set(txt,'String',descr);

fs=8;
N=T*fs;
ts=0:1/fs:T-1/fs;


hold on
ys=sin(2*pi*f0*ts);
plot(ts,ys,'ro')
plot([0 T],[0 0],'k')
for i=1:length(ts)
    plot([ts(i) ts(i)],[0 ys(i)],'k--')
end



pause;
set(txt,'String',sprintf('Así, para T=%5.2f s tenemos %5.2f * %d = %5.2f muestras',T,T,fs,N));
pause


set(txt,'String','Calculamos ahora los coeficientes de Fourier para esa muestra');

cla()
b=fft(ys);



% plot(abs(b),'ro');
% hold on;
% for i=1:length(b)
%     plot([i i],[0 abs(b(i))],'k')
% end
% 
% pause
% clc
% cla()
% disp('Dibujamos ahora las frecuencias reordenadas');
% disp('Hay que tener cuidado pues hay que dividir por T las frecuencias');

c=fftshift(b)/N;

if mod(N,2)==1
    freq=-(N-1)/2:(N-1)/2;
else
    freq=-N/2:N/2-1;
end
freq=freq/T;


plot(freq,abs(c),'ro');
hold on;
for i=1:length(b)
    plot([freq(i) freq(i)],[0 abs(c(i))],'k')
end

%axis([min(freq)-0.1,max(freq)+0.1,0,max(abs(c))+0.1]);
pause
%axis auto
clc
cla()

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


desc = {'Supongamos la señal y=2*sin(2*pi*f0*t) durante T=3s',...
 'de frecuencia f0, es decir, f0 ciclos por segundo',...
'por ejemplo f0=4Hz serían 4 ciclos por segundo y un periodo 1/4'};
set(txt,'String',desc);


T=3;

f0=4;

t=linspace(0,T,500);
plot(t,2*sin(2*pi*f0*t))



pause

desc={'La frecuencia de muestreo fs indica cada cuanto tomamos una señal',...
    'Por ejemplo fs=10 indica que tomamos 10 muestras cada segundo',...
    'o equivalentemente, cada ts=1/fs=1/10'};
set(txt,'String',desc);



fs=10;
N=T*fs;
ts=0:1/fs:T-1/fs;

hold on
ys=2*sin(2*pi*f0*ts);
plot(ts,ys,'ro')
plot([0 T],[0 0],'k')
for i=1:length(ts)
    plot([ts(i) ts(i)],[0 ys(i)],'k--')
end



pause
set(txt,'String',sprintf('Así, para T=%5.2f s tenemos %5.2f * %d = %5.2f muestras',T,T,fs,N));
pause
clc

set(txt,'String','Calculamos ahora los coeficientes de Fourier para esa muestra');

cla()
b=fft(ys);


c=fftshift(b)/N;

if mod(N,2)==1
    freq=-(N-1)/2:(N-1)/2;
else
    freq=-N/2:N/2-1;
end
freq=freq/T;


plot(freq,abs(c),'ro');
hold on;
for i=1:length(b)
    plot([freq(i) freq(i)],[0 abs(c(i))],'k')
end

pause

cla()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set(txt,'String','¿Qué ocurre si el tiempo de muestreo es ahora T=3.2s')

T=3.2;
f0=4;
t=linspace(0,T,500);
plot(t,2*sin(2*pi*f0*t))
pause
clc

fs=10;
ts=0:1/fs:T-1/fs;
hold on
ys=2*sin(2*pi*f0*ts);
plot(ts,ys,'ro')
plot([0 T],[0 0],'k')
for i=1:length(ts)
    plot([ts(i) ts(i)],[0 ys(i)],'k--')
end



N=fs*T;
set(txt,'String',{'En este caso no se obtiene un número entero de ciclos de la señal',...
    sprintf('Ya que f0*T=%5.2f ciclos',f0*T)})
pause
clc

set(txt,'String','Calculamos ahora los coeficientes de Fourier para esa muestra');

cla()
b=fft(ys);



% plot(abs(b),'ro');
% hold on;
% for i=1:length(b)
%     plot([i i],[0 abs(b(i))],'k')
% end
% 
% pause
% clc
% cla()
% disp('dibujamos ahora las frecuencias reordenadas');
% disp('Hay que tener cuidado pues hay que dividir por T las frecuencias');

c=fftshift(b)/N;

if mod(N,2)==1
    freq=-(N-1)/2:(N-1)/2;
else
    freq=-N/2:N/2-1;
end

freq=freq/T;


plot(freq,abs(c),'ro');
hold on;
for i=1:length(b)
    plot([freq(i) freq(i)],[0 abs(c(i))],'k')
end
pause
set(txt,'String','Este efecto se conoce como leakage')
pause
clc
cla()

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

desc={'Consideremos ahora la señal y=cos(2*pi*f0*t)',...
'con f0=4 Hz y que muestreamos con fs=5 durante T=1 s'};
set(txt,'String',desc);

T=1;
f0=4;
t=linspace(0,T,500);
plot(t,cos(2*pi*f0*t))
pause
clc


fs=5;
ts=0:1/fs:T-1/fs;
hold on
ys=cos(2*pi*f0*ts);
plot(ts,ys,'ro')
plot([0 T],[0 0],'k')
for i=1:length(ts)
    plot([ts(i) ts(i)],[0 ys(i)],'k--')
end



N=fs*T;
desc={sprintf('Así, para T=%5.2f s tenemos %5.2f * %d = %5.2f muestras',T,T,fs,N),...
'En este caso no se obtiene un número entero de ciclos de la señal'};
set(txt,'String',desc);
pause
clc

set(txt,'String','Calculamos ahora los coeficientes de Fourier para esa muestra');

cla()
b=fft(ys);



% plot(abs(b),'ro');
% hold on;
% for i=1:length(b)
%     plot([i i],[0 abs(b(i))],'k')
% end
% 
% pause
% clc
% cla()
% disp('dibujamos ahora las frecuencias reordenadas');
% disp('Hay que tener cuidado pues hay que dividir por T las frecuencias');

c=fftshift(b)/N;

if mod(N,2)==1
    freq=-(N-1)/2:(N-1)/2;
else
    freq=-N/2:N/2-1;
end

freq=freq/T;


plot(freq,abs(c),'ro');
hold on;
for i=1:length(b)
    plot([freq(i) freq(i)],[0 abs(c(i))],'k')
end

pause
set(txt,'String','Estamos obteniendo una frecuencia incorrecta. ¿Por qué?')
pause
clc
cla

set(txt,'String',{'Porque la frecuencia de muestreo no ha sido la adecuada',...
'Si muestreamos ahora y=cos(2*pi*t) con la misma frecuencia de muestreo'})

plot(t,cos(2*pi*f0*t))
hold on
plot(t,cos(2*pi*t),'m')

ys=cos(2*pi*f0*ts);
plot(ts,ys,'ro')
plot([0 T],[0 0],'k')
for i=1:length(ts)
    plot([ts(i) ts(i)],[0 ys(i)],'k--')
end

ys=cos(2*pi*ts);
plot(ts,ys,'ro')
plot([0 T],[0 0],'k')
for i=1:length(ts)
    plot([ts(i) ts(i)],[0 ys(i)],'k--')
end

pause
set(txt,'String','Este efecto se conoce como aliasing')
pause
clc


desc={'Para evitar este problema se usa un teorema muy importante',...
'en teoría de la señal que se llama teorema del muestreo: ',...
'La frecuencia máxima que se puede detectar en una señal',...
'con una frecuencia de muestreo fs sería fs/2'};
set(txt,'String',desc);
pause


desc={'En nuestro ejemplo fs=5 y podríamos detectar',...
'como máximo una frecuencia de fs/2=2.5',...
'Que es inferior a la frecuencia f0=4 Hz'};
set(txt,'String',desc);




