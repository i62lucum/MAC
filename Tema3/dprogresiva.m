function dy=dprogresiva(xi,yi)

n=length(xi);
dy = zeros(n-1,1);

for i=1:n-1
   dy(i)=(yi(i+1)-yi(i))/(xi(i+1)-xi(i));
end


end