close
clc %this line just clears your command window
clear
i=1; 
options = optimset('display', 'off');

r=[70 30 50 55 125];
w2=10; %rad/sec
th1=270*pi/180;
for theta=0:1:360
    the(i)=theta*pi/180; % saves each value of the input theta in an array
    
    theta34(:,i)=fsolve(@position_1,[5.23 4.363],options,the(i),r);
    thetas = [th1 the(i) theta34(:,i)'];
    if theta34(1,i)<0
        theta34(1,i)=theta34(1,i)+2*pi;
    end
    if theta34(2,i)<0
        theta34(2,i)=theta34(2,i)+2*pi;
    end
    
    theta4=theta34(2,i);
    theta5r6(:,i)=fsolve(@position_2,[3.6655 70],options,theta4,r);
    
    
    if theta5r6(1,i) < 0
        theta5r6(1,i)=theta5r6(1,i)+2*pi;
    end
    thetas(5)=theta5r6(1,i);
    
    omega34(:,i)=fsolve(@velocity_1,[1 1], options, thetas, r, w2);
    omegas = [0 w2 omega34(:,i)'];
    w4=omegas(4);
    omega5r6d(:,i)=fsolve(@velocity_2,[1 1], options, thetas, r, w4);
    omegas(5)=omega5r6d(1,i);
    
    alpha2=0;
    alpha34(:,i)=fsolve(@acceleration_1,[1 1], options, thetas, r, omegas, alpha2);
    alpha4=alpha34(1,i);
    alpha5r6dd(:,i)=fsolve(@acceleration_2,[1 1], options, thetas, r, omegas, alpha4);
    
    i=i+1; 
end 
theta34=theta34*180/pi;
theta5r6(1)=theta5r6(1)*180/pi;
the = the*180/pi;

subplot(6,1,1)
plot(the(1,:),theta34(1,:),the(1,:),theta34(2,:)); legend('\theta_3', '\theta_4')
subplot(6,1,2)
plot(the(1,:),theta5r6(1,:),the(1,:),theta5r6(2,:)); legend('\theta_5', 'r_6')
subplot(6,1,3)
plot(the(1,:),omega34(1,:),the(1,:),omega34(2,:)); legend('\omega_3', '\omega_4')
subplot(6,1,4)
plot(the(1,:),omega5r6d(1,:),the(1,:),omega5r6d(2,:)); legend('\omega_5', 'v_6')
subplot(6,1,5)
plot(the(1,:),alpha34(1,:),the(1,:),alpha34(2,:)); legend('\alpha_3', '\alpha_4')
subplot(6,1,6)
plot(the(1,:),alpha5r6dd(1,:),the(1,:),alpha5r6dd(2,:)); 
hl = legend('$\alpha_5$', '$\ddot{r}_6$')
set(hl, 'Interpreter', 'latex');
grid;