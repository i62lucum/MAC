

Tiempo=[0 0.5 1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0];
Radio=[0 0.236 0.667 1.225 1.886 2.635 3.464 4.365 5.333 6.364 7.454];


derivada=dcentrada(Tiempo, Radio);

fprintf('La derivada es:');
disp(derivada.');