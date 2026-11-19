clc
clear all
close all
f = inline('((150/108)*exp(-0.5*t))','t','Vc');
ti = 0;%initial data point
Vc = 0;%initial value
xf = 2.5;%final data point
h = 0.5;%step size
[T,Y] = RK_4(f,1/6,1/3,1/3,1/6,0.5,0.5,0.5,0,0.5,1,0,0,1,h,ti,Vc,xf)
plot(T,Y);
legend('4th Order RK method');
grid on
title('Capacitor voltage at each time')
xlabel('Time')
ylabel('Capacitor Voltage')
