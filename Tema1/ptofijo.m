function s=ptofijo(g,x0,tol)

x=x0;
x_sig=g(x);
while(abs(x_sig-x)>tol)
    x=x_sig;
    x_sig=g(x);
end

s=x;
end