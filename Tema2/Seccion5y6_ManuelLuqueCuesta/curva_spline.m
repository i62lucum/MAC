function [x,y]=curva_spline(xi,yi,t)

N=length(xi)-1;

h=sqrt(diff(xi).^2+diff(yi).^2);
ti=zeros(1,N+1);
ti(2:N+1)=cumsum(h);
ti=ti/ti(end);

x=spline_cubico(ti,xi,t);
y=spline_cubico(ti,yi,t);


end