function s=secante(f,a,b,tolerancia)

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

dist=b-a;
fA=f(a);
fB=f(b);

c=-(fA*dist/(fB-fA))+a;
fC=f(c);
while(abs(fC)>tolerancia)
    if(fA*fC<=0)
        fB=fC;
        b=c;
    else
        fA=fC;
        a=c;
    end 
    c=-(fA*dist/(fB-fA))+a;
    fC=f(c);
    dist=b-a;
end

s=c;


end