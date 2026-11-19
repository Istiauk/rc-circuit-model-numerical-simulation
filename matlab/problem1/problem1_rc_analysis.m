clc;
clear all;
close all;
t = [0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5];
Vc = [0, 1.106, 1.967, 2.638, 3.161, 3.568, 3.884, 4.131, 4.323, 4.473, 4.59, 4.68, 4.751, 4.806]; % Voltage in volts
Ic_true = [250 194.7 151.63 118.09 91.97 71.626 55.783 43.443 33.834 26.35 20.521 15.982 12.447 9.6936]; % Current in mA
t = t * 1e-3;
Vc = Vc * 1e3;
C = 108e-6; % C = 100+8(group number = 8)) uF.
Vc_diff = diff(Vc) ./ diff(t);
Ic_approx = C * Vc_diff;
disp('[1] The value of Approximated currents Ic (mA):');
disp(Ic_approx(:))
error = abs((Ic_true(1:end-1) - Ic_approx) ./ Ic_true(1:end-1)) * 100;
disp('[2] The list of Error for each point:');
disp(error(:)) % Displays each error value on a new line
figure(1)
plot(t(1:end-1), Ic_approx, 'r', 'LineWidth', 1)
hold on;
plot(t,Ic_true,'b', 'LineWidth', 1)
xlabel('Time (s)');
ylabel('Current (A)');
legend('Approximated Current', 'True Current');
title('Comparison of Approximated and True Current');
grid on;
hold off;
% We considered 3rd order polynomial
n = 3;
p = polyfit(t, Ic_true, n);
t_fit = linspace(min(t), max(t), 100);
Ic_fit = polyval(p, t_fit);
figure
plot(t, Ic_true, 'bo')
hold on
plot(t_fit, Ic_fit, 'r-')
xlabel('Time (s)')
ylabel('Current (A)')
legend('Original Data', 'Fitted Curve')
title('Curve Fitting using Polynomial Model')
grid on
hold off
% Given time= 4 sec, so 4e-3 mA
t_val = 4e-3;
Ic_val = polyval(p, t_val);
disp(['[3] The current Ic at t = 4 sec is ', num2str(Ic_val), ' mA'])
index = find(t == t_val);
Ic_true_val = Ic_true(index);
Ic_approx_val = polyval(p, t_val);
error = abs((Ic_true_val - Ic_approx_val) / Ic_true_val) * 100;
disp(['[4] The relative percentage true error at t = 4 sec is ', num2str(error), '%'])
