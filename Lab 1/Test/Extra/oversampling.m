clc; clear; close all;

fm = 10;
fs = 80;

t = 0:0.0001:1;
ts = 0:1/fs:1;

x = sin(2*pi*fm*t);
xs = sin(2*pi*fm*ts);

plot(t, x, 'k-', 'LineWidth', 1.5);
hold on;
plot(ts, xs, 'r--', 'LineWidth', 1.5);
plot(ts, xs, 'bo', 'MarkerFaceColor', 'b');

title('Oversampling');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Original Signal', 'Reconstructed Signal', 'Samples');

grid on;
axis tight;
ylim([-1.2 1.2]);