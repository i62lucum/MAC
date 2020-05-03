
xi=[0 2 4 7 10];
yi=[4 1.5 3 5 3];

x= linspace(0,10,100);


y=spline_cubico(xi,yi,x);

clf

plot(x,y)