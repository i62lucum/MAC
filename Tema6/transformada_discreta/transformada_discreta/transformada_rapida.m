function [c,freq]=transformada_rapida(y)
%[c,freq]=transformada_rapida(y)
% Dibuja el diagrama de frecuencias para y
% ej: 
%t=linspace(0,1,101);
%y=sin(2*pi*t);
%[c,freq]=transformada_rapida(y);

T=1;
N=length(y);

Y=fft(y);


c=fftshift(Y);

if mod(N,2)==1
    freq=-(N-1)/2:(N-1)/2;
else
    freq=-N/2:N/2-1;
end

freq=freq/T;

c=c/N;





    
plot(freq,abs(c),'.')