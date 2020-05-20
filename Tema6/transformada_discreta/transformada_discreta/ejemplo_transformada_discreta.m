%Ejemplo de uso transformada rápida

close all
scrsz = get(0,'ScreenSize');
fig=figure('Position',[1 scrsz(4) scrsz(3) scrsz(4)]);


ax1=subplot(5,1,1,'Visible','off');
ax2=subplot(5,1,[2 5]);



descr = {'Empezamos con y=sin(2*pi*t)','que muestreamos en el intervalo [0,1] usando Fs','Por ejemplo Fs=7'};

axes(ax1); % sets ax1 to current axes

set(gca,'DefaulttextFontSize',18);
txt=text(.025,0.8,descr);


axes(ax2);


T=1;
fs=7;
N=T*fs;
t=0:1/fs:T-1/fs;
y=sin(2*pi*t);


tt=linspace(0,1,500);
yy=sin(2*pi*tt);

plot(tt,yy,t,y,'ro');

pause
set(txt,'String',{'Calculamos la transformada discreta:','b=fft(y)'})
pause
b=fft(y);
cla()



plot(abs(b),'ro');
hold on;
for i=1:length(b)
    plot([i i],[0 abs(b(i))],'k')
end

axis([0,length(b)+1,0, max(abs(b))+0.3]);
pause

cla();

set(txt,'String',{'Ahora reordenamos las frecuencias:','c=fftshift(y)', ' plot(abs(c))'})
c=fftshift(b);
plot(abs(c),'ro');
hold on;
for i=1:length(c)
    plot([i i],[0 abs(c(i))],'k')
end
pause;

cla();

set(txt,'String',{'Además de reordenar hay que dividir por N:','c=fftshift(b)/N', ' plot(abs(c))'})
c=fftshift(b)/N;
plot(abs(c),'ro');
hold on;
for i=1:length(c)
    plot([i i],[0 abs(c(i))],'k')
end
pause;


set(txt,'String',{'Ahora vamos a asignar a cada punto de c la frecuencia que le corresponde',...
    'freq = -(N-1)/2:(N-1)/2','plot(freq,abs(c)','','CUIDADO: si N es par freq=-N/2:N/2-1'});


if mod(N,2)==1
    freq=-(N-1)/2:(N-1)/2;
else
    freq=-N/2:N/2-1;
end

pause
cla();

plot(freq,abs(c),'ro');
hold on;
for i=1:length(b)
    plot([freq(i) freq(i)],[0 abs(c(i))],'k')
end

axis([min(freq),max(freq),0, max(abs(c))+0.1]);

pause


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cla()

set(txt,'String',{'¿Qué ocurre si usamos el doble de tiempo T=2','manteniendo la misma separación entre puntos o muestreo'});

fs=7;
T=2;
N=T*fs;

t=0:1/fs:T-1/fs;
y=sin(2*pi*t);


tt=linspace(0,2,500);
yy=sin(2*pi*tt);

plot(tt,yy,t,y,'ro');

axis([0,2,-1.1,1.1]);

pause
set(txt,'String',{'Calculamos la transformada discreta:','b=fft(y)'})
pause
b=fft(y);
cla()



plot(abs(b),'ro');
hold on;
for i=1:length(b)
    plot([i i],[0 abs(b(i))],'k')
end

axis([0,length(b)+1,0, max(abs(b))+0.3]);
pause

cla();

set(txt,'String',{'Ahora reordenamos las frecuencias:','c=fftshift(b)', ' plot(abs(c))'})
c=fftshift(b);
plot(abs(c),'ro');
hold on;
for i=1:length(c)
    plot([i i],[0 abs(c(i))],'k')
end
pause;

cla()

set(txt,'String',{'Además de reordenar hay que dividir por N:',...
    'Pero ahora N aquí es el número de puntos total: 14',...
    'ya que tenemos dos periodos T=2','c=fftshift(y)/N', ' plot(abs(c))'})
c=fftshift(b)/N;
plot(abs(c),'ro');
hold on;
for i=1:length(c)
    plot([i i],[0 abs(c(i))],'k')
end
pause;


set(txt,'String',{'Ahora vamos a asignar a cada punto de c la frecuencia que le corresponde',...
    'En general, para un periodo T, las frecuencias son ... -3/T, -2/T,-1/T, 0, 1/T, 2/T, 3/T...',...
    'freq = -(N-1)/2:(N-1)/2; freq=freq/T;','plot(freq,abs(c)','CUIDADO: si N es par freq=-N/2:N/2-1'});


if mod(N,2)==1
    freq=-(N-1)/2:(N-1)/2;
else
    freq=-N/2:N/2-1;
end

freq=freq/T;
pause
cla();

plot(freq,abs(c),'ro');
hold on;
for i=1:length(b)
    plot([freq(i) freq(i)],[0 abs(c(i))],'k')
end

axis([min(freq)-0.1,max(freq)+0.1,0, max(abs(c))+0.1]);

pause


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


cla

descr={'Tomemos ahora una señal compuesta:',...
    'y=0.5*sin(2*pi*2*t)+cos(2*pi*5*t)-sin(2*pi*4*t)',...
    'que dibujamos en el intervalo [0,3) usando 30 puntos',...
    'es decir, muestreamos la señal con fs=1/10',...
    't=0:1/fs:T-1/fs'};

set(txt,'String',descr);

T=3;
fs=10;

t=0:1/fs:T-1/fs;
N=fs*T;


y=0.5*sin(2*pi*2*t)+cos(2*pi*5*t)-sin(2*pi*4*t);


plot(t,y,'ro');
hold on
tfino=linspace(0,T,500);
yfino=0.5*sin(2*pi*2*tfino)+cos(2*pi*5*tfino)-sin(2*pi*4*tfino);
plot(tfino,yfino);

axis([0,T,min(yfino)-0.1,max(yfino)+0.1]);

pause

set(txt,'String',{'Calculamos la transformada discreta:','b=fft(y)'})
pause
b=fft(y);
cla()



plot(abs(b),'ro');
hold on;
for i=1:length(b)
    plot([i i],[0 abs(b(i))],'k')
end

axis([0,length(b)+1,0, max(abs(b))+0.3]);
pause

cla();

set(txt,'String',{'Ahora reordenamos las frecuencias:','c=fftshift(y)', ' plot(abs(c))'})
c=fftshift(b);
plot(abs(c),'ro');
hold on;
for i=1:length(c)
    plot([i i],[0 abs(c(i))],'k')
end
pause;

cla()

set(txt,'String',{'Además de reordenar hay que dividir por N:',...
    'Pero ahora N aquí es el número de puntos total: 30',...
    'ya que tenemos tres periodos T=3','c=fftshift(y)/N', ' plot(abs(c))'})
c=fftshift(b)/N;
plot(abs(c),'ro');
hold on;
for i=1:length(c)
    plot([i i],[0 abs(c(i))],'k')
end

axis([0,length(c)+1,0, max(abs(c))+0.3]);
pause;


set(txt,'String',{'Ahora vamos a asignar a cada punto de c la frecuencia que le corresponde',...
    'recordando que tenemos T=3',...
    'freq = -(N-1)/2:(N-1)/2; freq=freq/3;','plot(freq,abs(c)','CUIDADO: si N es par freq=-N/2:N/2-1'});


if mod(N,2)==1
    freq=-(N-1)/2:(N-1)/2;
else
    freq=-N/2:N/2-1;
end

freq=freq/T;

pause
cla();

plot(freq,abs(c),'ro');
hold on;
for i=1:length(b)
    plot([freq(i) freq(i)],[0 abs(c(i))],'k')
end

axis([min(freq)-0.1,max(freq)+0.1,0, max(abs(c))+0.1]);

pause
















