close all;
img = imread('pato.jpg');   
figure('units','normalized','outerposition',[0 0 1 1])
axis
hold on;                                 
image([0 20],[1 0],img); 

