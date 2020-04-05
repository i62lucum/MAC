function transmision(individuos)

margenBorde=0.05;
margenColision=0.15;

pause('on')

hold on
axis([0 4 0 4])

%Campos del individuo
%1,2->Posicion
%3,4->Dirección
%5->Velocidad
%6,7,8->RGB
%9->Infectado
poblacion=zeros(individuos,9);


%El primer individuo esta siempre infectado para garantizar el experimento

%Posicion
poblacion(1,1)=rand()*3+0.5;
poblacion(1,2)=rand()*3+0.5;
%Direccion
poblacion(1,3)=rand()*2-1;
poblacion(1,4)=rand()*2-1;
%Velocidad
poblacion(1,5)=rand()*0.1+0.03;
%RGB
poblacion(1,6)=0;
poblacion(1,7)=0.8;
poblacion(1,8)=0;
poblacion(1,9)=1;


%Generacion de la poblacion
for i=2:individuos
    %Posicion
    poblacion(i,1)=rand()*3+0.5;
    poblacion(i,2)=rand()*3+0.5;
    %Direccion
    poblacion(i,3)=rand()*2-1;
    poblacion(i,4)=rand()*2-1;
    %Velocidad
    poblacion(i,5)=rand()*0.1+0.03;
    %RGB
    %Con una probabilidad esta inicialmente infectado
    if(rand()<0.1)
        poblacion(i,6)=0;
        poblacion(i,7)=0.8;
        poblacion(i,8)=0;
        poblacion(i,9)=1;
    else
        poblacion(i,6)=0;
        poblacion(i,7)=0;
        poblacion(i,8)=0.8;
        poblacion(i,9)=0;
    end
end

%Se almacenan las graficas para modificarlas a posteriori
for i=1:individuos
    graficas(i)=plot(poblacion(i,1),poblacion(i,2),'o','color',poblacion(i,6:8),'LineWidth',4);
end

%Hasta que el usuario lo interrumpa con CTRL-C
while(true)
    %Se actualiza cada individuo
    for i=1:individuos
        
        %Se actualiza la posicion
        poblacion(i,1)=poblacion(i,1)+poblacion(i,5)*poblacion(i,3);
        poblacion(i,2)=poblacion(i,2)+poblacion(i,5)*poblacion(i,4);
        %Se actualiza posicion graficamente
        set(graficas(i),'XData',poblacion(i,1))
        set(graficas(i),'YData',poblacion(i,2))
        
        %Si colisiona con los extremos de la ventana, la velocidad se
        %mantiene constante pero en el sentido opuesto
        %Colision con las rectas y=0 o y=4
        if (4-poblacion(i,1)<margenBorde || poblacion(i,1)<margenBorde)
            poblacion(i,3)=poblacion(i,3)*(-1);
        end
        %Colision con las rectas x=0 o x=4
        if (4-poblacion(i,2)<margenBorde || poblacion(i,2)<margenBorde)
            poblacion(i,4)=poblacion(i,4)*(-1);
        end
        
        %Posicion del individuo actual
        puntoA=[poblacion(i,1) poblacion(i,2)];
        
        for j=i:(individuos)
            %Posicion del individuo a comparar
            puntoB=[poblacion(j,1) poblacion(j,2)];
            %Se obtiene la distancia
            dist=pdist2(puntoA,puntoB);
            
            %Si la distancia es inferior al margen, se chocan
            if(dist<margenColision)
                %Se almacenan las velocidades
                v1_x=poblacion(i,3);
                v1_y=poblacion(i,4);
                v1=poblacion(i,5);
                
                %Como las masas son identicas, mediante el choque elastico,
                %las velocidades de los individuos se intercambian
                poblacion(i,3)=poblacion(j,3);
                poblacion(i,4)=poblacion(j,4);
                poblacion(i,5)=poblacion(j,5);
                
                poblacion(j,3)=v1_x;
                poblacion(j,4)=v1_y;
                poblacion(j,5)=v1;
                
                %Si el choque se ha producido entre un infectado y un no
                %infectado, se infecta este último
                if(poblacion(i,9)==1 && poblacion(j,9)==0)
                    poblacion(j,9)=1;
                    poblacion(j,6:8)=poblacion(i,6:8);
                    set(graficas(j),'color',poblacion(j,6:8))
                elseif(poblacion(i,9)==0 && poblacion(j,9)==1)
                    poblacion(i,9)=1;
                    poblacion(i,6:8)=poblacion(j,6:8);
                    set(graficas(i),'color',poblacion(i,6:8))
                end
            end
        end
    end
    pause(0.1)
    %clf
    hold on
    axis([0 4 0 4])
end



end