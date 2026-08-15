clc;
clear;
close all;


A = 1;
f = 5;
t = 0:0.001:1;


y = A * sin(2*pi*f*t);



figure;
plot(t,y);
grid on;

title("Sine wave");
xlabel("Time (s)");
ylabel("Amplitude");
