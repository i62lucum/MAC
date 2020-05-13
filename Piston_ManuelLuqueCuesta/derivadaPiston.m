function y=derivadaPiston(x1)

global phi a r L;

y=2*(a+x1)*r^2*sin(phi)^2-((L^2-(x1+a)^2)*2*(x1-r*cos(phi))-(2*(x1+a)*(x1-r*cos(phi))^2));

end