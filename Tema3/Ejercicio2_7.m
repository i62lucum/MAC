


fun = @(x) x.^8;


I_trapecio=trapecio_comp(fun,-4,4,100);
I_matlab=integral(fun,-4,4);

fprintf('Integral de x.^8:\n---------------------------------\n')
fprintf('Trapecio Compuesta: %f\n',I_trapecio)
fprintf('Integral matlab:    %f\n',I_matlab)


fprintf('\n')


fun = @(x) x.^4.*sin(x/2)-exp(x);


I_trapecio=trapecio_comp(fun,0,5,100);
I_matlab=integral(fun,0,5, 'RelTol',1e-8,'AbsTol',1e-13);

fprintf('Integral de x^4*sin(x/2)-exp(x):\n---------------------------------\n')
fprintf('Trapecio Compuesta: %f\n',I_trapecio)
fprintf('Integral matlab:    %f\n',I_matlab)
