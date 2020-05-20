close all
scrsz = get(0,'ScreenSize');
fig=figure('Position',[1 scrsz(4) scrsz(3) scrsz(4)]);


ax1 = axes('Position',[.1  .7  .8  .2],'Visible','off');
ax2 = axes('Position',[.1  .1  .8  .6]);

descr = {'Sampling rate:';'Supongamos la señal y=sin(2*pi*f0*t) durante T=2s';
    'de frecuencia f0, es decir, f0 ciclos por segundo'; 
    'por ejemplo f0=3Hz serían 3 ciclos por segundo y un periodo 1/3'};

axes(ax1); % sets ax1 to current axes

set(gca,'DefaulttextFontSize',18);
txt=text(.025,0.8,descr);



T=2;
f0=3;
t=linspace(0,T,500);
plot(ax2,t,sin(2*pi*f0*t));
pause

descr ={'La frecuencia de muestreo fs indica cada cuanto tomamos una señal';
'Por ejemplo fs=8 indica que tomamos 8 muestras cada segundo';
'o equivalentemente, cada ts=1/fs=1/8'};

set(txt,'String',descr)

fs=8;
ts=0:1/fs:T-1/fs;
axes(ax2)
hold on
ys=sin(2*pi*f0*ts);
plot(ts,ys,'ro')
plot([0 T],[0 0],'k')
for i=1:length(ts)
    plot([ts(i) ts(i)],[0 ys(i)],'k--')
end

pause
N=fs*T;
descr = {descr{:} sprintf('Así, para T=%5.2f s tenemos %5.2f * %d = %5.2f muestras',T,T,fs,N) };
set(txt,'String',descr)

descr = {'Valores usuales para la frecuencia de muestreo:';
    '8.000 Hz para señales de teléfono, walkie-talkie, etc.';
    '44.100 Hz para audio CD (por defecto para audio MPEG-1 (VCD, SVCD, MP3))';
    '48.000 Hz  estándar equipos de video profesional digital, sonido DVD, TDT, etc.';
    '192.000 Hz Blu-ray, HD DVD'};
pause

descr = {'Valores usuales para la frecuencia de muestreo:';
    '8000 Hz para señales de teléfono, walkie-talkie, etc.';
    '44100 Hz para audio CD (por defecto para audio MPEG-1 (VCD, SVCD, MP3))';
    '48,000 Hz  estándar equipos de video profesional digital, sonido DVD, TDT, etc.';
    '192,000 Hz Blu-ray, HD DVD'};
set(txt,'String',descr)
pause

cla(ax2);

descr = {'Seleccionaremos a partir de ahora T=2s y Fs=44100'};
set(txt,'String',descr)
pause;
Fs = 44100;

descr={'A440 con frecuencia 440 Hz es la nota que sirve para afinar los instrumentos (A3)'};
set(txt,'String',descr)
axes(ax2);
t = 0: 1/Fs : 2;
f=440;
subplot(5,1,1,ax1);
subplot(5,1,[2 3],ax2);
ax3=subplot(5,1,[4 5]);
playnote(t,f,Fs,ax2,ax3);

pause
cla(ax2)
cla(ax3)
set(txt,'String',{'Notas musicales';
    'Frecuencias f 9/8*f 5/4*f 4/3*f 3/2*f 5/3*f 15/8*f 2*f';
    'Para que sean audibles empezaremos por f=264'});

f=1;
f=[f 9/8*f 5/4*f 4/3*f 3/2*f 5/3*f 15/8*f 2*f];

axes(ax2);

plot([0 ,2*f(1)],[0,0],'k');
hold on;
plot(f(1),0,'o','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',10);
plot(f(3),0,'o','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',10);
plot(f(5),0,'o','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',10);
plot(f(8),0,'o','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',10);
plot(f(2),0,'s','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
plot(f(7),0,'s','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
plot(f(4),0,'v','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
plot(f(6),0,'v','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);

axis([0 2 -0.5 0.5]);

notas={'C' 'D' 'E' 'F' 'G' 'A' 'B' 'C'};

for i=1:length(f)
    text(f(i),-0.07,notas{i});
end

pause
f=264;
f=[f 9/8*f 5/4*f 4/3*f 3/2*f 5/3*f 15/8*f 2*f];

for i=1:length(f)
    playnote(t,f(i),Fs)
end