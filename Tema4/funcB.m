function zk=funcB(t,z)
    global b a w f0;
    zk = zeros(2,1);
    zk(1) = z(2);
    zk(2) = -b^2*z(1)-2*a*z(2)+ f0*cos(w*t);
end