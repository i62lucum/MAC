function x=solucion(t,a,b,F0,omega)
bCuad = b^2;
aCuad = a^2;
bOme = (bCuad-omega^2);
aOme = 2.*a.*omega;

phi = atan(aOme./bOme);
F = F0./(sqrt(bOme^2 + aOme^2))*sign(F0*bOme/cos(phi));

xp = F.*cos(omega.*t-phi)

bA = sqrt(bCuad-aCuad)
bA.*t
cos(bA.*t)
c1 = 1 - F.*cos(phi)
c2 = a/(sqrt(bA)).*(1-((bCuad+omega^2)./(bOme).*F.*cos(phi)))


x=exp(-a*t).*(c1.*cos(bA.*t)+c2.*sin(bA.*t))+xp;

end