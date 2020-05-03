
%PARAMETROS PARA EL EJEMPLO CON VARIAS FUNCIONES
C1 = 10; %Constante de la primera funcion
C2 = 5; %Constante de la segunda funcion
x0 = 1; %Valor inicial de x0
h = 0.1; %Tamanyo del paso
k = 2; %Numero de pasos a dar
func1 = @(x,y) y;%La derivada de Ce^x
funcReal1 = @(x) C1*exp(x);%La funcion real Ce^x
func2 = @(x,y) x*y^2;%La derivada de la segunda funcion
funcReal2 = @(x) -2./(x.^2+C2);%La segunda funcion


y0(1) = funcReal1(x0);
y0(2) = funcReal2(x0);

x = linspace(x0, x0+k*h, k+1);
y1 = funcReal(x);
y2 = funcReal2(x);

[xk,yk]=mEuler({func1,func2}, x0, y0, h, k);


clf
hold on

plot(xk,yk(1,:), 'Color', 'b')
plot(x,y1, 'Color', 'r')


Xlim = get(gca,'XLim');
Ylim = get(gca,'YLim');

text(Xlim(2),Ylim(2)-0.1*(Ylim(2)-Ylim(1)),'Real1','FontSize',10,'FontWeight','bold','Color','r', 'HorizontalAlignment', 'right')
text(Xlim(2),Ylim(2)-0.15*(Ylim(2)-Ylim(1)),'Aproximacion1','FontSize',10,'FontWeight','bold','Color','b', 'HorizontalAlignment', 'right')

input('Introduzca enter para continuar');
close(gcf)
hold on
plot(xk,yk(2,:), 'Color', 'b')
plot(x,y2, 'Color', 'r')

Xlim = get(gca,'XLim');
Ylim = get(gca,'YLim');

text(Xlim(2),Ylim(2)-0.2*(Ylim(2)-Ylim(1)),'Real2','FontSize',10,'FontWeight','bold','Color','r', 'HorizontalAlignment', 'right')
text(Xlim(2),Ylim(2)-0.25*(Ylim(2)-Ylim(1)),'Aproximacion2','FontSize',10,'FontWeight','bold','Color','b', 'HorizontalAlignment', 'right')


