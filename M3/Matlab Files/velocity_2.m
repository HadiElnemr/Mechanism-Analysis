function w=velocity_2(output, theta, r, w4)
r4=r(4);
r5=r(5);
th6=pi;

th4=theta(4);
th5=theta(5);

w5=output(1);
r6_dot=output(2);

w = [ w5 * r5 * sin(th5) + ...
     -w4 * r4 * sin(th4) + ...
      r6_dot * cos(th6) ;
      w5 * r5 * cos(th5) + ...
      w4 * r4 * cos(th4) + ...
      r6_dot * sin(th6) ;
    ];
end