%Definición transformada discreta

close all
scrsz = get(0,'ScreenSize');
fig=figure('Position',[1 scrsz(4) scrsz(3) scrsz(4)]);


ax1=subplot(5,1,1,'Visible','off');
ax2=subplot(5,1,[2 5]);



descr = {'Supongamos una señal periódica de periodo T','f:[0,T] -> R'};

axes(ax1); % sets ax1 to current axes

set(gca,'DefaulttextFontSize',18);
txt=text(.025,0.8,descr);


axes(ax2);
pause
descr={'Utilizamos una frecuencia de muestreo Fs','t=0:1/Fs:T',...
    'Eso nos da N=Fs*T puntos','El último punto sería en realidad del siguiente periodo'};
set(txt,'String',descr)

T=2;
Fs=4;
N=Fs*T;
t=0:1/Fs:T;

plot(t,zeros(size(t)),'ro');
hold on;
plot([0 T],[0 0],'k');
for k=1:length(t)
     text(t(k),-0.1,sprintf('t%d',k-1))
end
axis([-0.2 T+0.2 -1.2 1.2]);

pause

set(txt,'String', 'N me determina una partición de la circunferencia unidad')

cla()

theta=linspace(0,2*pi,100);
plot(cos(theta),sin(theta));
hold on

for k=0:N-1
    xp=cos(2*pi*k/N);
    yp=sin(2*pi*k/N);
    plot(xp,yp,'ro')
    plot([0 xp],[0 yp],'k')
    text(1.1*xp,1.1*yp,sprintf('\\omega_{N}^{%d}',k),'FontSize',18,'HorizontalAlignment','Center');
    
end

axis([-1.5 1.5 -1.5 1.5])
axis equal

pause

set(txt,'String', 'Supongamos por un momento N un número impar')
cla()
pause

N=7;
plot(cos(theta),sin(theta));

xp=1;
yp=0;
k=0;
plot(xp,yp,'ro')

plot([0 xp],[0 yp],'k')
text(1.2*xp,1.2*yp,sprintf('c_{%d}',k),'FontSize',18,'HorizontalAlignment','Center');

for k=1:(N-1)/2
    xp=cos(2*pi*k/N);
    yp=sin(2*pi*k/N);
    plot(xp,yp,'ro')
    plot(xp,-yp,'ro')
    plot([0 xp],[0 yp],'k')
    plot([0 xp],[0 -yp],'k')
    text(1.2*xp,1.2*yp,sprintf('c_{%d}',k),'FontSize',18,'HorizontalAlignment','Center');
    text(1.2*xp,-1.2*yp,sprintf('c_{-%d}',k),'FontSize',18,'HorizontalAlignment','Center');
    
end

pause

for k=0:N
    xp=cos(2*pi*k/N);
    yp=sin(2*pi*k/N);
    text(1.4*xp,1.4*yp,sprintf('\\beta_{%d}',k),'FontSize',18,'HorizontalAlignment','Center','Color',[0 0 1]);
    
end
set(txt,'String', 'IMPORTANTE: hay que dividir \beta por 1/N')
pause;
%-------------------------------------------------

set(txt,'String', 'Si N es un número par')
cla()
pause

N=8;
plot(cos(theta),sin(theta));

xp=1;
yp=0;
k=0;
plot(xp,yp,'ro')

plot([0 xp],[0 yp],'k')
text(1.2*xp,1.2*yp,sprintf('c_{%d}',k),'FontSize',18,'HorizontalAlignment','Center');

for k=1:N/2-1
    xp=cos(2*pi*k/N);
    yp=sin(2*pi*k/N);
    plot(xp,yp,'ro')
    plot(xp,-yp,'ro')
    plot([0 xp],[0 yp],'k')
    plot([0 xp],[0 -yp],'k')
    text(1.2*xp,1.2*yp,sprintf('c_{%d}',k),'FontSize',18,'HorizontalAlignment','Center');
    text(1.2*xp,-1.2*yp,sprintf('c_{-%d}',k),'FontSize',18,'HorizontalAlignment','Center');
    
end

k=N/2;
xp=cos(2*pi*k/N);
yp=sin(2*pi*k/N);
plot(xp,-yp,'ro')
plot([0 xp],[0 -yp],'k')
text(1.2*xp,-1.2*yp,sprintf('c_{-%d}',k),'FontSize',18,'HorizontalAlignment','Center');

pause

for k=0:N
    xp=cos(2*pi*k/N);
    yp=sin(2*pi*k/N);
    text(1.4*xp,1.4*yp,sprintf('\\beta_{%d}',k),'FontSize',18,'HorizontalAlignment','Center','Color',[0 0 1]);
    
end
