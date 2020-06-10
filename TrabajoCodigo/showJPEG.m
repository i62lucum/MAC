%Muestra la imagen que esta almacenada en un archivo .mat
%   Recibe el nombre del fichero.
function showJPEG(compressedFileName)

%Se carga la compresion de la imagen.
compressed = load(compressedFileName,'compressed');
compressed = compressed.compressed;

%Se extrae los primeros tres campos que son informacion
filas = compressed{1};
columnas = compressed{2};
canales = compressed{3};

%La matriz de cuantificacion de Losheller
Q = [16 11 10 16 24 40 51 61;
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99];


%Se crea la matriz que será la foto.
foto = double(zeros(filas,columnas, canales));

count = 4;

for channel=1:canales
   for i=1:8:filas-8+1
       for j=1:8:columnas-8+1
           %Se obtiene la matriz a patir del vector en zigzag.
           A = zigZag2Mat(compressed{count},8);
           %Se multiplica elemento a elemento por la matriz de
           %cuantificacion.
           N = A.*Q;
           %La inversa de la transformada de coseno bidimensional.
           M = ITCD2D(N);
           %Se asigna el bloque a la imagen
           foto(i:i+8-1,j:j+8-1,channel) = M;
           count=count+1;
       end
   end
end

%Anyade las ultimas filas que tienen menos de 8 y no se han podido meter en bloque
restoFilas = mod(filas,8);
if restoFilas ~=0
    foto(filas-restoFilas+1:filas,:,:) = compressed{count};
    count=count+1;
end

%Anyade las ultimas columnas que tienen menos de 8 y no se han podido meter
%en bloque
restoColumnas = mod(columnas,8);
if restoColumnas ~=0
    if restoFilas ~=0
        foto(1:filas-restoFilas+1,columnas-restoColumnas+1:columnas,:) = compressed{count};
    else
        foto(:,columnas-restoColumnas+1:columnas,:) = compressed{count};
    end
end

%Se suma 128 para dejarlo en el rango 0-255
foto = foto+128;
%Se transforma a uint8.
foto = uint8(foto);

imshow(foto);
end