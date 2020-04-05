function piston(w,T,aa,rr,LL)


pause('on'); 


global a r L phi;
a=aa;
r=rr;
L=LL;
phi=0;

t=linspace(0,T,100);
x1=L;x0=L;
x2=0;




clf
%Se fijan los ejes
axis equal
axis([0 L -L/2 L/2]);
hold on


%Se pinta la circunferencia
m=linspace(0,2*pi,100);
x=r*cos(m)+a;
y=r*sin(m);
plot(x,y);


%Se pinta la manivela
y_manivela(1)=0;
y_manivela(2)=sin(phi)*r;
x_manivela(1)=a;
x_manivela(2)=a+cos(phi)*r;
manivela=plot(x_manivela,y_manivela,'LineWidth',4);


%Se pinta la barra
x_barra(1)=0;
x_barra(2)=x1+a;
y_barra(1)=x2;
y_barra(2)=0;
barra=plot(x_barra,y_barra,'LineWidth',6);


for i=2:length(t)
   pause(0.1);
   phi=0+w*t(i);
   x1=NewtonRaphson(@funcionPiston,@derivadaPiston,x0,10^-8);
   x2=piston_x2(x1,L,a);
   if(sin(phi)<0)
      x2=x2*-1; 
   end
   
   x0=x1;
   
   %Se redibuja la manivela
   x_manivela(2)=a+cos(phi)*r;
   y_manivela(2)=sin(phi)*r;
   set(manivela,'XData',x_manivela);
   set(manivela,'YData',y_manivela);
   
   %Se redibuja la barra
   x_barra(2)=x1+a;
   y_barra(1)=x2;
   set(barra,'XData',x_barra);
   set(barra,'YData',y_barra);
end






end