close
clc %this line just clears your command window
clear
i=1; 
options = optimset('display', 'off');

r=[70 30 50 55 125];
w2=30; %rad/sec
th1=270*pi/180;
prev_w3 = 1;
prev_w4 = 1;
for theta=0:1:360
    the(i)=theta*pi/180; % saves each value of the input theta in an array
    % Where theta is theta 2
    theta34(:,i)=fsolve(@position_1,[5.23 3.9],options,the(i),r);
    thetas = [th1 the(i) theta34(:,i)'];
    if theta34(1,i)<0
        theta34(1,i)=theta34(1,i)+2*pi;
    end
    if theta34(2,i)<0
        theta34(2,i)=theta34(2,i)+2*pi;
    end
    if theta34(1,i)>2*pi
        theta34(1,i)=theta34(1,i)-2*pi;
    end
    if theta34(2,i)>2*pi
        theta34(2,i)=theta34(2,i)-2*pi;
    end
    
    theta4=theta34(2,i);
    
    theta5r6(:,i)=fsolve(@position_2,[3.9 70],options,theta4,r);
    
    if theta5r6(1,i) < 0
        theta5r6(1,i)=theta5r6(1,i)+2*pi;
    end
    if theta5r6(1,i) > 2*pi
        theta5r6(1,i)=theta5r6(1,i)-2*pi;
    end
    thetas(5)=theta5r6(1,i);
    
    omega34(:,i)=fsolve(@velocity_1,[-7 15], options, thetas, r, w2);
    
    omegas = [0 w2 omega34(:,i)'];

    w4=omegas(4);
    omega5r6d(:,i)=fsolve(@velocity_2,[6 200], options, thetas, r, w4);
    omegas(5)=omega5r6d(1,i);
    
    alpha2=0;
    alpha34(:,i)=fsolve(@acceleration_1,[240 68], options, thetas, r, omegas, alpha2);
    alpha4=alpha34(2,i);
    alpha5r6dd(:,i)=fsolve(@acceleration_2,[20 18100], options, thetas, r, omegas, alpha4);
    
    i=i+1; 
end 
theta34=theta34*180/pi;
theta5r6(1,:)=theta5r6(1,:)*180/pi;

the = the*180/pi;
m=3;
n=4;
subplot(m,n,1)
grid;
plot(the(1,:),theta34(1,:)); legend('\theta_3')

subplot(m,n,2)
plot(the(1,:),theta34(2,:)); legend('\theta_4')

subplot(m,n,3)
plot(the(1,:),theta5r6(1,:)); legend('\theta_5')

subplot(m,n,4)
plot(the(1,:),theta5r6(2,:)); legend('r_6')

subplot(m,n,5)
plot(the(1,:),omega34(1,:)); legend('\omega_3')

subplot(m,n,6)
plot(the(1,:),omega34(2,:)); legend('\omega_4')

subplot(m,n,7)
plot(the(1,:),omega5r6d(1,:)); legend('\omega_5')

subplot(m,n,8)
plot(the(1,:),omega5r6d(2,:)); legend('v_6')

subplot(m,n,9)
plot(the(1,:),alpha34(1,:)); legend('\alpha_3')

subplot(m,n,10)
plot(the(1,:),alpha34(2,:)); legend('\alpha_4')

subplot(m,n,11)
plot(the(1,:),alpha5r6dd(1,:)); legend('\alpha_5')

subplot(m,n,12)
plot(the(1,:),alpha5r6dd(2,:));
hl = legend('$\ddot{r}_6$')
set(hl, 'Interpreter', 'latex');

grid;