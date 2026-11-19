clc;
clear all;
close all;
R1 = 500;
R2 = 700;
C1 = 1e-6;
C2 = 47e-6;
q = R1*C1+R2*C2+R1*C2;
r= R1*R2*C1*C2;
% Convert transfer function to state-space representation
[A, B, C, D] = tf2ss(1, [r, q, 1])
t = 0:0.01:1;
u = ones(size(t));
[y, t, x] = lsim(ss(A, B, C, D), u, t);
figure;
plot(t, y, 'LineWidth', 2, 'Color', 'green');
title('Step Response of State Space System');
xlabel('Time');
ylabel('Amplitude');
grid on;
