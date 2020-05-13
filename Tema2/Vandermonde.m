function m=Vandermonde(X, grado)

tam=size(X);

if(tam(1)<tam(2))
   X=X.';
   long=tam(2);
else
   long=tam(1);
end

if ~exist('grado','var') == 1
    m=ones(long,long);

    for i=2:long
        size(m(:,i-1));
        m(:,i)=m(:,i-1).*X; 
    end
else
    m=ones(long,grado+1);
    for i=2:grado+1
        size(m(:,i-1));
        m(:,i)=m(:,i-1).*X; 
    end
end

end