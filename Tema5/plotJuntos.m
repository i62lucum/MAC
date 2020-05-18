
clf
n = [1,3,6];
coef1 = [-3i/2, -1i/2, 1i];
coef2 = [3i/2, 1i/2, -1i];
nombre = "1.juntos";

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