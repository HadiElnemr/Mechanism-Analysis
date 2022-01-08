function w=velocity_1(output, theta, r, w2)
r1=r(1);
r2=r(2);
r3=r(3);
r4=r(4);

%th1=theta(1);
theta=theta*pi/180;

th2=theta(2);
th3=theta(3);
th4=theta(4);

%th1=270;

w3=output(1);
w4=output(2);
w = [ w2 * r2 * cos(th2) + ...
      w3 * r3 * cos(th3) + ...
      w4 * r4 * cos(th4) ;
      w2 * r2 * sin(th2) + ...
      w3 * r3 * sin(th3) + ...
      w4 * r4 * sin(th4) ;
    ];
end