clc;

clear;

close all;



A = 1;

f = 5;

t = 0:0.001:1;



y1 = A * sin(2*pi*f*t);

y2 = A * cos(2*pi*f*t);


disp(t);


figure;

plot(t,y1);
hold on;

plot(t,y2)
hold off;
grid on;

legend('Sine Wave', 'Cosine Wave');
title("Sine wave");

xlabel("Time (s)");

ylabel("Amplitude");
