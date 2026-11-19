clc
clear all
close all
f = inline('((150/108)*exp(-0.5*t))','t','Vc');
ti = 0;%initial data point
Vc = 0;%initial value
xf = 2.5;%final data point
h = 0.5;%step size
[T,Y] = RK_4(f,1/6,1/3,1/3,1/6,0.5,0.5,0.5,0,0.5,1,0,0,1,h,ti,Vc,xf)
tr = [0,0.5,1,1.5,2,2.5,3];
V = [0,1.106,1.967,2.638,3.161,3.568,3.884];
plot(T,Y,'*');
title('Voltage vs Time')
xlabel('Time')
ylabel('Calculated Voltage & True Voltage')
hold on
plot(tr,V)
legend('Calculated Voltage','True Voltage');
