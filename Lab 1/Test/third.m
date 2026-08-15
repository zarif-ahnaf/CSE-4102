clc;
clear;
close all;

A = 1;
f = 5;
t = 0:0.001:1;

y1 = A * sin(2*pi*f*t);
y2 = A * cos(2*pi*f*t);

figure;

% First subplot (Top)
subplot(2, 1, 1);
plot(t, y1);
grid on;
title('Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');

% Second subplot (Bottom)
subplot(2, 1, 2);
plot(t, y2);
grid on;
title('Cosine Wave');
xlabel('Time (s)');
ylabel('Amplitude');
