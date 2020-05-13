
%Se obtienen las x sin nodos
x_sin_nodos=linspace(-1,1,10);
%Se obtienen las y sin nodos
y_sin_nodos=ejercicio4(x_sin_nodos);

%Se obtienen las abscisas de prueba para realizar una grafica
x_prueba=linspace(-1,1,100);

%Se obtienen las abscisas de prueba reales para realizar una grafica
y_prueba_real=ejercicio4(x_prueba);

%Se obtienen las ordenadas de prueba sin nodos para realizar una grafica
y_newton_sin_nodos=pol_newton(x_sin_nodos,y_sin_nodos,x_prueba);


%Se obtienen las x sin nodos
x_con_nodos=nodos_chebyshev(-1,1,10);
%Se obtienen las y sin nodos
y_con_nodos=ejercicio4(x_con_nodos);

%Se obtienen las ordenadas de prueba con nodos para realizar una grafica
y_newton_nodos=pol_newton(x_con_nodos,y_con_nodos,x_prueba);


clf
hold on

%Comentar y descomentar para ejecutar una u otra.

%La funcion original
plot(x_prueba,y_prueba_real)

%La funcion interpolada sin nodos
%plot(x_prueba,y_newton_sin_nodos)


%La funcion interpolada con nodos
plot(x_prueba,y_newton_nodos)
