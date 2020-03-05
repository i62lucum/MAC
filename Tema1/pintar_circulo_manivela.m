function pintar_circulo_manivela(r,a)

t=linspace(0,2*pi,100);
x=r*cos(t)+a;
y=r*sin(t);

plot(x,y);


end