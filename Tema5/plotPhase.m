
clf
n = 3;
coef1 = -1i/2;
coef2 = 1i/2;
nombre = "1.2";

max = 6;

max = max + 1;

c = zeros(max*2+1,1);

cero = max + 1;
c(cero-n) = coef1;
c(cero+n) = coef2;


fases(c)

nombreFich = "Images/"+"fases_"+nombre+".png";
saveas(gcf,nombreFich);


amplitudes(c)
nombreFich = "Images/"+"amplit_"+nombre+".png";
saveas(gcf,nombreFich);