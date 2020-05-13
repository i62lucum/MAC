function dy=dcentrada(xi,yi)

n=length(xi);
dy = zeros(n-2,1);

for i=2:n-1
   dy(i-1)=(yi(i+1)-yi(i-1))/(xi(i+1)-xi(i-1));
end


end