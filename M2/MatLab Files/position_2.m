function w=position_2(output, th4, r)
r4=r(4);
r5=r(5);

th6=pi;

th5 = output(1);
r6 = output(2);

w=[ - ( r5 * cos(th5) ) + ...
    r4  * cos(th4) + ...
    r6 * cos(th6);
    
    - ( r5 * sin(th5) ) + ...
    r4 * sin(th4) + ...
    r6 * sin(th6);
      
  ];
end