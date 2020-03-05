function pintar_piston(a,r,phi,x1,x2)
clf
hold on
axis equal
pintar_barra(a,x1,x2);

pintar_manivela(r,a,phi);

pintar_circulo_manivela(r,a);

end