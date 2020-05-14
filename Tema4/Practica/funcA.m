function zk=funcA(t,z)
    global b a;
    zk = zeros(2,1);
    zk(1) = z(2);
    zk(2) = -b^2*z(1)-2*a*z(2);
    
end