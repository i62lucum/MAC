function piston(w,T,aa,rr,LL)

hold on
pause('on'); 

global a r L phi;
a=aa;
r=rr;
L=LL;

t=linspace(0,T,100);
phi=0;
x1=L;x0=L;
x2=0;

pintar_piston(a,r,phi,x1,x2);

for i=2:length(t)
   pause(0.1);
   phi=0+w*t(i);
   x1=NewtonRaphson(@funcionPiston,@derivadaPiston,x0,10^-8);
   x2=piston_x2(x1,L,a);
   if(sin(phi)<0)
      x2=x2*-1; 
   end
   pintar_piston(a,r,phi,x1,x2);
   x0=x1;
   %0,L,-L/2,L/2
end






end