function newA=TCD2D(A)
    
N = size(A);
N = N(1);


C = vandermondeC(N);

newA = C*A*C.';


end