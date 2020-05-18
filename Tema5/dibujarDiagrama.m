function dibujarDiagrama(c, yLabel)


lenC = length(c);

ticklabels = strings(lenC,1);
ticks = zeros(lenC,1);
count = -(lenC-1)/2;
for i=1:lenC
    ticks(i) = i;
    if count == 0
        ticklabels(i) = '0';
    else
        ticklabels(i) = strcat('$\frac{',int2str(count),'}{T}$');
    end
    count = count + 1;
end


stem(c,'MarkerEdgeColor', 'red')

set(gca,'TickLabelInterpreter', 'latex');
xticks(ticks)
ax = gca;
ax.FontSize = 14; 
xticklabels(ticklabels)
ylabel(yLabel)
XLim=get(gca, 'XLim');
XLim(1) = 0.85;
XLim(2) = XLim(2)+0.15;
set(gca,'XLim',XLim)

set(gcf,'position',[0,0,1280,256])


end