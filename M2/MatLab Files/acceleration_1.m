function w=acceleration_1(output, theta, r, w,a2)
r1=r(1);
r2=r(2);
r3=r(3);
r4=r(4);

%th1=theta(1);
th2=theta(2);
th3=theta(3);
th4=theta(4);

%w1=w(1);
w2=w(2);
w3=w(3);
w4=w(4);

a3=output(1);
a4=output(2);

w=[ -w2^2 * r2 * cos(th2) - a2 * r2 * sin(th2) + ...
    -w3^2 * r3 * cos(th3) - a3 * r3 * sin(th3) + ...
    -w4^2 * r4 * cos(th4) - a4 * r4 * sin(th4) ;
    
    -w2^2 * r2 * sin(th2) + a2 * r2 * cos(th2) + ...  
    -w3^2 * r3 * sin(th3) + a3 * r3 * cos(th3) + ...
    -w4^2 * r4 * sin(th4) + a4 * r4 * cos(th4)
  ];
end