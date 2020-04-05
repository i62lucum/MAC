function y=funcionPiston(x1)

global phi a r L;

y=(a+x1)^2*r^2*sin(phi)^2-(L^2-(x1+a)^2)*(x1-r*cos(phi))^2;

end