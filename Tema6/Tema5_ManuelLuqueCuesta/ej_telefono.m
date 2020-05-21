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

%audio = audioplayer(telefono, Fs);
%play(audio)

%pause;

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

%Observando la imagen de los sonidos estas son aproximadamente los
%intervalos para cada sonido
zones = [0.0001 0.25;
         0.4001 0.65;
         0.8001 1.05;
         1.2001 1.45;
         1.6001 1.85;
         2.0501 2.3;
         2.4501 2.7;
         2.8501 3.1;
         3.2501 3.5];
%Cuantos valores hay por tecla
aux = Fs*Ttecla;
%En la grafica venian multiplicados por 10^4.
zones = zones*10^4;
%El extremo superior del intervalo, es el inferior mas los valores por
%tecla.
zones(:,2)=zones(:,1)+aux-1;

%La correspondencia entre las frecuencias y los valores del teclado
rows = [697 770 852 941];
columns = [1209 1336 1477];
sounds=['1' '2' '3';
        '4' '5' '6';
        '7' '8' '9';
        '*' '0' '#'];
     

%El numero de valores a obtener, y el numero de coeficientes
N=Ttecla*Fs;
zones = uint32(round(zones));
nNumeros = length(zones);
numeros = zeros(nNumeros, N);

%Se extraen los datos para cada numero
for i=1:nNumeros
    numeros(i,:) = telefono(zones(i,1):zones(i,2));
end

%La variable que almacenara progresivamente el numero pulsado
numeroFinal='';
%Umbral para eliminar el ruido
umbral = 50;

%Por cada numero pulsado
for numero=1:nNumeros
    %Se obtienen las betas
    b=fft(numeros(numero,:));
    %Se ordenan
    b=fftshift(b);
    %El rango de frecuencias
    aux = -N/2:1:N/2-1;
    
    %Para el conteo de frecuencias mayores que el umbral, ya que puede
    %darse el caso de que haya frecuencias similares como 840 y 848 debido
    %al ruido o a un mal muestreo.
    count=1;
    for i=1:N
        if abs(b(i))<umbral
            b(i)=0;
        else
            %Se divide entre tiempotecla dado que este es el intervalo de
            %muestreo, de modo que se obtiene su frecuencia real.
            freq(count)=aux(i)/Ttecla;
            count=count+1;
        end
    end
    

    %plot(aux/Ttecla, abs(b))
    %pause
    
    %Como las frecuencias son simetricas, nos quedamos con la parte
    %positiva
    freq = freq(length(freq)/2+1:length(freq));
    
    %Puede darse el caso de que haya frecuencias similares como: 840, 844,
    %852..., todas ellas representan el mismo valor en el telefono el 852,
    %por lo que con una de ellas bastaría, nos quedamos con la primera ya
    %que sabemos con seguridad que pertecene a la frecuencia de las filas
    freq1 = freq(1);
    %Para la frecuencia de las columnas, ocurre lo mismo que antes, solo
    %que ahora nos quedariamos con la ultima que sabemos que pertenece a
    %las columnas, ya que la frecuencia de las columnas es mayor que la de
    %las filas.
    freq2 = freq(length(freq));

    %Se busca el minimo error, aquella frecuencia con la minima diferencia
    %sera la del numero pulsado
    row = 1;
    min = abs(freq1-rows(1));
    for i=2:4
        current = abs(freq1-rows(i));
        if current < min
            min = current;
            row = i;
        end
    end

    column = 1;
    min = abs(freq2-column(1));
    for i=2:3
        current = abs(freq2-columns(i));
        if current < min
            min = current;
            column = i;
        end
    end
    
    %Se concatena el numero escogido.
    numeroFinal=strcat(numeroFinal, sounds(row,column));    
    
end

fprintf('El numero marcado es %s\n', numeroFinal);


