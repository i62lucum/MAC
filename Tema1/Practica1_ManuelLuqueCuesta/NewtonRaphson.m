function s=NewtonRaphson(f,df,x0,tol)

x=x0;
x_sig=x-f(x)/df(x);

while(abs(f(x))>tol)
    x=x_sig;
    x_sig=x-f(x)/df(x);
end

s=x_sig;

end