xi = [1 3 5 7];
yi = [300 450 560 680];

x = 6;

%Se obtiene el valor y 
y = pol_newton(xi, yi, 6);

%De aqui en adelante se obtiene el polinomio en formato de texto para
%representarlo para el usuario
pol = dif_div(xi,yi);
pol = pol(1,:);

polinomio=formateaPolinomio(pol,xi);

disp(['El resultado del contador para el mes 6 es de ', num2str(y), 'kWh, por lo que la facturación este mes debería ser de ', num2str(y- yi(3))])

disp(strcat('El polinomio interpolador es:  ', polinomio))
