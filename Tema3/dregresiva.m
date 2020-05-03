function dy=dprogresiva(xi,yi)

n=length(xi);
dy = zeros(n-1,1);

for i=2:n
   dy(i-1)=(yi(i)-yi(i-1))/(xi(i)-xi(i-1));
end


end