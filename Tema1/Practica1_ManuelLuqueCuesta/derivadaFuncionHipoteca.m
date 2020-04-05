function y=derivadaFuncionHipoteca(x)

global A n C;

y=A*(1+n*(1+x)^-(n+1))-C;



end