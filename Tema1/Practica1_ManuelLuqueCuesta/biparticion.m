function s=biparticion(f,a,b,tolerancia)

if(a==b)
    disp('a no ha de ser igual a b');
    s=0;
    return;
end

fA=f(a);
if(fA*f(b)>0)
    disp('f(a) y f(b) han de tener distinto signo');
    s=0;
    return;
end

if(b<a)
    aux=a;
    a=b;
    b=aux;
end


n=ceil(log((b-a)/tolerancia)/log(2)+1);


for i=1:n
    c=(b+a)/2;
    fC=f(c);
    if(fA*fC<=0)
        b=c;
    else
        fA=fC;
        a=c;
    end
end

s=c;
end