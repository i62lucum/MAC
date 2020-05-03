xi = [1 3 5];
yi = [300 450 560];

x = 6;

%Se obtiene el valor "y" y la matriz A
[y,A] = pol_newton_matriz(xi, yi, 6);
pol = A(1,:);

polinomio=formateaPolinomio(pol,xi);

disp(strcat('El polinomio interpolador es:  ', polinomio))

%Ahora se quiere obtener a partir de lo anterior un nuevo polinomio
xi = [1 3 5 7 9];
yi = [300 450 560 680 800];
[y,A] = pol_newton_matriz(xi, yi, 6, A);
pol = A(1,:);
polinomio=formateaPolinomio(pol,xi);

disp(strcat('El polinomio interpolador es:  ', polinomio))


