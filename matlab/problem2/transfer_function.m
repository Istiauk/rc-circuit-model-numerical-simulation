clc;
clear all;
close all;
R1 = 500;
R2 = 700;
C1 = 1e-6;
C2 = 47e-6;
%Transfer Function = 1/[(C1*C2*R1*R2)s^2 + (C1*R1 + C2*R2 + C2*R1)s + 1]
A = R1*C1+R2*C2+R1*C2;
B= R1*R2*C1*C2;
num = 1;
den = [B, A, 1];
% Create the transfer function
h = tf(num, den)
t = 0:0.01:1;
u = ones(size(t));
[y, t] = step(h, t);
figure;
plot(t, y, 'LineWidth', 2, 'Color', 'red');
title('Step Response of Transfer Function');
xlabel('Time');
ylabel('Amplitude');
grid on;
