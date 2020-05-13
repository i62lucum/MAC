

h_medio=1.7;
desviacion=0.1;
poblacion=200;

normal= @(h) poblacion/(desviacion*sqrt(2*pi))*exp(-((h-h_medio)^2)/(2*desviacion*desviacion));



margenInf=1.3;
margenSup=2.1;
paso=0.1;
pasos=round((margenSup-margenInf)/paso+1);


hValues=linspace(margenInf,margenSup,pasos);
porcentajes=zeros(pasos-1,1);

for i=1:pasos-1
    porcentajes(i)=simpson_comp(normal,hValues(i),hValues(i+1),10);
end

porcentajes=porcentajes./poblacion;

fprintf("Intervalos:")
disp(hValues)

fprintf("Porcentajes:    ")
disp(porcentajes.')



