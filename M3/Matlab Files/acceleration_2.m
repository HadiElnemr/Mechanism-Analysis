function w=acceleration_2(output, theta, r, w,a4)
r4=r(4);
r5=r(5);


th4=theta(4);
th5=theta(5);
th6=pi;

w4=w(4);
w5=w(5);

a4=a4;

a5=output(1);
r6_ddot=output(2);

w=[  -( -w5^2 * r5 * cos(th5) - a5 * r5 * sin(th5))+ ...
        -w4^2 * r4 * cos(th4) - a4 * r4 * sin(th4) + ...
        +r6_ddot * cos(th6) ;

     -( -w5^2 * r5 * sin(th5) + a5 * r5 * cos(th5))+ ...
        -w4^2 * r4 * sin(th4) + a4 * r4 * cos(th4) + ...
        +r6_ddot * sin(th6) ;
  ];
end