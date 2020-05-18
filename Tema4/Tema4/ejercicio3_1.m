
%PARAMETROS PARA EL EJEMPLO CON UNA SOLA FUNCION
C = 10; %Constante
x0 = 1; %Valor inicial de x0
h = 0.1; %Tamanyo del paso
k = 20; %Numero de pasos a dar
func = @(x,y) y;%La derivada de Ce^x
funcReal = @(x) C*exp(x);%La funcion real Ce^x


y0 = funcReal(x0);

x = linspace(x0, x0+k*h, k+1);
y = funcReal(x);

[xk,yk]=mHeun(func, x0, y0, h, k);


clf
hold on

plot(xk,yk, 'Color', 'b',  'LineWidth', 1.5, 'Marker', '*')
plot(x,y, 'Color', 'r','LineWidth', 2)


Xlim = get(gca,'XLim');
Ylim = get(gca,'YLim');


text(Xlim(2),Ylim(2)-0.1*(Ylim(2)-Ylim(1)),'Real','FontSize',10,'FontWeight','bold','Color','r', 'HorizontalAlignment', 'right')
text(Xlim(2),Ylim(2)-0.15*(Ylim(2)-Ylim(1)),'Aproximacion','FontSize',10,'FontWeight','bold','Color','b', 'HorizontalAlignment', 'right')

