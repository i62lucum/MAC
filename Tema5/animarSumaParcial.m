%Para crear una ventana ajustado al tamanyo de pantalla
figure('Units', 'Normalized', 'OuterPosition', [0 0 1 1])

N=30;
step=2;
T=6;

c=fourier(@senyal,N,T);
subplot(3,1,2);
fases(c);

subplot(3,1,3);
amplitudes(c);

subplot(3,1,1);

pause('on');
for n=2:step:N
    cla;
    suma_parcial(@senyal,c,n,T);
    pause(2);
end
