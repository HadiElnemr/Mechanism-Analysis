function w=position_1(output, th2, r)
r1=r(1);
r2=r(2);
r3=r(3);
r4=r(4);
th1=270*pi/180;

th3 = output(1);
th4 = output(2);
w=[-r1 * cos(th1) + r2 * cos(th2) + r3 * cos(th3) + r4 * cos(th4);
   -r1 * sin(th1) + r2 * sin(th2) + r3 * sin(th3) + r4 * sin(th4)];
end