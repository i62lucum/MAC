function senoTaylor0(grado)

pause('on');

hold on;

axis([0 2*pi -3 3])
axis equal

x=linspace(0,2*pi,100);
y=zeros(100,grado);
y_real=sin(x);

plot(x,y_real,'LineWidth',4);

grado_actual=grado;

pause(2);
%Para dibujar una curva aproximada por grado
for i=1:grado
    acum=0;
    %Para resolver cada grado
    for j=1:grado-grado_actual+1
        modulo=mod(j,4);
        if(modulo==1)
            acum=acum+(x.^j)/factorial(j);
        elseif(modulo==3)
            acum=acum+(-1)*(x.^j)/factorial(j);
        end
    end
    y(:,i)=acum;
    grado_actual=grado_actual-1;
    plot(x,y(:,i));
    pause(2);
end




end