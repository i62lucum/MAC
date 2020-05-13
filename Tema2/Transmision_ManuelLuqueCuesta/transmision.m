function transmision(individuos, contagionProbability, tiempoRecuperacion)

if contagionProbability > 1 || contagionProbability < 0
    disp('La probabilidad de contagio debe ser un real entre 0 y 1');
    return;
end

if tiempoRecuperacion<0
    disp('El tiempo de recuperacion ha de ser un real positivo');
    return;
end

if individuos<0
    disp('El numero de individuos ha de ser un número natural');
    return;
end

margenBorde=0.05;
margenColision=0.1;



pause('on')

hold on
axis([0 4 0 4])

%Muro
plot([2 2], [0 1.5],'Color',[0 0 0], 'LineWidth', 3);

%Estadisticas
%1->Cantidad de Sanos
%2->Cantidad de Enfermos
%3->Cantidad de Recuperados
%4->Cantidad de Aisladas
stats=zeros(4,1);

stats(1)=individuos;

text(3.3,3.8,'            Sanos: ','FontSize',10,'FontWeight','bold','Color',[0 0 0.8])
text(3.3,3.65,'      Enfermos: ','FontSize',10,'FontWeight','bold','Color',[0 0.8 0])
text(3.3,3.5,'Recuperados: ','FontSize',10,'FontWeight','bold','Color',[0.8 0.8 0])
text(3.3,3.35,'       Aisladas: ','FontSize',10,'FontWeight','bold')

sanos = text(4.2,3.8, string(stats(1)));
enfermos = text(4.2,3.65,string(stats(2)));
curados = text(4.2,3.5,string(stats(3)));

%Campos del individuo
%1,2->Posicion
%3,4->Dirección
%5->Velocidad
%6,7,8->RGB
%9->Infectado
%10->Tiempo desde infectado
%11->Particula aislada (no se mueve)
poblacion=zeros(individuos,11);


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


stats(1)=stats(1)-1;
stats(2)=1;

set(sanos,'String',string(stats(1)));
set(enfermos,'String',string(stats(2)));


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
        stats(1)=stats(1)-1;
        stats(2)=stats(2)+1;
        set(sanos,'String',string(stats(1)));
        set(enfermos,'String',string(stats(2)));
    else
        poblacion(i,6)=0;
        poblacion(i,7)=0;
        poblacion(i,8)=0.8;
        poblacion(i,9)=0;
    end
    %Con una probabilidad la particula se encuentra aislada.
    if(rand()<0.08)
        poblacion(i,11)=1;
        stats(4) = stats(4) +1;
    end
end

%Aisladas totales
text(4.2,3.35,string(stats(4)));

%Se almacenan las graficas para modificarlas a posteriori
for i=1:individuos
    graficas(i)=plot(poblacion(i,1),poblacion(i,2),'o','color',poblacion(i,6:8),'LineWidth',4);
end

tiempoEtapa = 0;
%Hasta que el usuario lo interrumpa con CTRL-C
while(true)
    %Se actualiza cada individuo
    tic;
    for i=1:individuos
        %Si la particula es aislada no se mueve    
        if(poblacion(i,11)==0)
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
            
            %Colision con el muro vertical definido por los puntos, A=(2, 0) y
            %B=(2,1.5)
            if(abs(2-poblacion(i,1))<margenBorde && poblacion(i,2)<1.6)
                poblacion(i,3) = poblacion(i,3)*(-1);
            end
            
        end
        
        %Posicion del individuo actual
        puntoA=[poblacion(i,1) poblacion(i,2)];
        
        if (poblacion(i,9) == 1) 
            poblacion(i,10) = poblacion(i,10) + tiempoEtapa;
            if poblacion(i,10) > tiempoRecuperacion
                %Se establece como recuperado y un color amarillento
                poblacion(i,9) = 2;
                poblacion(i,6)=0.8;
                poblacion(i,7)=0.8;
                poblacion(i,8)=0;
                set(graficas(i),'color',poblacion(i,6:8))
                
                %Se modifican las estadisticas para poner mas curados.
                stats(2)=stats(2)-1;
                stats(3)=stats(3)+1;
                set(enfermos,'String',string(stats(2)));
                set(curados,'String',string(stats(3)));
            end
        end
        
        for j=i:(individuos)
            %Posicion del individuo a comparar
            puntoB=[poblacion(j,1) poblacion(j,2)];
            %Se obtiene la distancia
            dist=sqrt( (puntoA(1)-puntoB(1))*(puntoA(1)-puntoB(1)) + (puntoA(2)-puntoB(2)) * (puntoA(2)-puntoB(2)) );
            %dist = pdist2(puntoA, puntoB);
            %Si la distancia es inferior al margen, se chocan
            if(dist<margenColision)
                %Si la particula se encuentra aislada esta no modificara su
                %posicion
                if(poblacion(j,11)==1 || poblacion(i,11)==1)
                    if(poblacion(j,11)==1)
                        poblacion(i,3)=poblacion(i,3)*(-1);
                        poblacion(i,4)=poblacion(i,4)*(-1);
                    else
                        poblacion(j,3)=poblacion(j,3)*(-1);
                        poblacion(j,4)=poblacion(j,4)*(-1);                        
                    end
                else
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
                end
                
                %Si el choque se ha producido entre un infectado y un no
                %infectado, se infecta este último
                if(poblacion(i,9)==1 && poblacion(j,9)==0)
                    %Solo se infecta si la probabilidad es mayor que la de
                    %contagio
                    if rand() < contagionProbability
                        %Se setean los campos de infectado y el color
                        poblacion(j,9)=1;
                        poblacion(j,6:8)=poblacion(i,6:8);
                        set(graficas(j),'color',poblacion(j,6:8))
                        
                        %Las estadisticas se modifican
                        stats(1)=stats(1)-1;
                        stats(2)=stats(2)+1;
                        set(sanos,'String',string(stats(1)));
                        set(enfermos,'String',string(stats(2)));
                    end

                elseif(poblacion(i,9)==0 && poblacion(j,9)==1)
                    %Solo se infecta si la probabilidad es mayor que la de
                    %contagio
                    if rand() < contagionProbability
                        %Se setean los campos de infectado y el color
                        poblacion(i,9)=1;
                        poblacion(i,6:8)=poblacion(j,6:8);
                        set(graficas(i),'color',poblacion(i,6:8))
                        
                        %Las estadisticas se modifican
                        stats(1)=stats(1)-1;
                        stats(2)=stats(2)+1;
                        set(sanos,'String',string(stats(1)));
                        set(enfermos,'String',string(stats(2)));
                    end
                end
            end
        end
    end
    pause(0.1)
    %Para medir el tiempo de infeccion en esta etapa
    tiempoEtapa = toc;
end



end