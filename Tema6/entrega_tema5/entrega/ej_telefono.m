close all

%Cargamos los datos:
load num_telefono.mat

%Esto nos proporciona las siguientes variables
% T = tiempo total
% Ttecla = tiempo de una tecla
% telefono = muestreo correspondiente al sonido de todas las teclas
% Fs = frecuencia de muestreo
% keypad = imagen con la informacion asociada a cada tecla



%Para reproducir el sondio de los diferentes numeros existen dos formas:

%sound(telefono,Fs);

%o bien

audio = audioplayer(telefono, Fs);
play(audio)

pause;

%Dibujamos el sonido correspondiente al telefono
%En el dibujo se observan los sonidos de las diferentes teclas

plot(telefono);


pause;
close all



%Cada tecla tiene asignada un tono 
imshow(keypad);

%La tarea a realizar consiste en:
% 1. Separar el audio de los diferentes tonos de las tecla
% 2. Analizar, mediante los coeficientes de Fourier, cuales son las
% frecuencias asocidas a cada audio
% 3. Determinar el numero de telefono marcado

