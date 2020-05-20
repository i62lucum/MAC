function A=vandermondeF(N)

A=ones(N,N);
wN=zeros(N-1,1);
wN(1)= exp(1i*2*pi/N);

for i=2:N-1
    wN(i) = wN(i-1)*wN(1);
end

for i=2:N
    A(2:N,i)= A(2:N,i-1).*wN;
end

end