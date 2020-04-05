%Funcion que obtiene el interes de una hipoteca a partir mediante los
%métodos de biparticion y NewtonRaphson
%   x_inf: extremo inferior del intervalo para biparticion
%   x_sup: extremo superior del intervalo para biparticion
%   x0: punto inicial de busqueda para NewtonRaphson
%   AA: valor a pagar por periodo
%   nn: numero de periodos
%   CC: cantidad solicitar mediante la hipoteca
function hipoteca(x_inf, x_sup,x0, AA, nn, CC)


global A n C;

C=CC;

n=nn;

A=AA;


tic;
result1=biparticion(@funcionHipoteca,x_inf, x_sup, 10^-8);
tiempoBi=toc;

tic;
result2=NewtonRaphson(@funcionHipoteca,@derivadaFuncionHipoteca,x0,10^-8);
tiempoNew=toc;
fprintf('Mediante biparticion: valor->%f  tiempo->%f\n',result1,tiempoBi);
fprintf('Mediante NewtonRaphson: valor->%f tiempo->%f\n',result2,tiempoNew);



end