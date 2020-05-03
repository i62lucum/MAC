
x=[1,1.03,1.05,1.07];

y=sin(x);

dy1=dprogresiva(x,y);
dy2=dregresiva(x,y);
dy3=cos(x);

fprintf("Derivada progresiva:");
disp(dy1.');
fprintf("Coseno:             ");
disp(dy3);
fprintf("Derivada regresiva:           ");
disp(dy2.');


