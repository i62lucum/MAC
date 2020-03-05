function pintar_manivela(r,a,phi)

y(1)=0;
y(2)=sin(phi)*r;
x(1)=a;
x(2)=a+cos(phi)*r;

plot(x,y,'LineWidth',4);

end
