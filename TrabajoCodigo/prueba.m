foto = imread('Captura.PNG');

[filas, columnas, canales] = size(foto);
foto = double(foto);
matrizCuantificacion = [16 11 10 16 24 40 51 61;
                        12 12 14 19 26 58 60 55;
                        14 13 16 24 40 57 69 56;
                        14 17 22 29 51 87 80 62;
                        18 22 37 56 68 109 103 77;
                        24 35 55 64 81 104 113 92;
                        49 64 78 87 103 121 120 101;
                        72 92 95 98 112 100 103 99];



foto = foto - 128;
newFoto = foto;

compresed = {filas, columnas, canales};

count = 4;

for channel=1:canales
   canal = foto(1:filas,1:columnas,channel);
   for i=1:8:filas-8
       for j=1:8:columnas-8
           group = canal(i:i+8-1,j:j+8-1);
           
           tGroup = TCD2D(group);
           
           R = round(tGroup./matrizCuantificacion);
           aux = R.*matrizCuantificacion;
           newFoto(i:i+8-1, j:j+8-1, channel) = ITCD2D(aux);
           %getZigZagArray
       end
   end
end

foto = foto+128;
foto = uint8(foto);

newFoto = newFoto+128;
newFoto = uint8(newFoto);