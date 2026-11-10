clc;
clear;
close all;

fm = 10;              % Message signal frequency (Hz)
fs = 12;              % Sampling frequency (Hz)

t = 0:0.0001:1;       % Continuous time
ts = 0:1/fs:1;        % Sampling time

% Original signal
x = sin(2*pi*fm*t);

% Sampled signal
xs = sin(2*pi*fm*ts);

% Calculate alias frequency and phase
fa = abs(fm - round(fm/fs)*fs);

% Aliased signal
xa = -sin(2*pi*fa*t);

% Plot original signal
plot(t, x, 'k-', 'LineWidth', 1.5);
hold on;

% Plot aliased signal
plot(t, xa, 'r--', 'LineWidth', 1.5);

% Plot sampling points
plot(ts, xs, 'bo', ...
    'MarkerFaceColor', 'b', ...
    'MarkerSize', 7);

% Formatting
title('Undersampling');
xlabel('Time (s)');
ylabel('Amplitude');

legend('Original Signal', ...
       'Reconstructed Signal', ...
       'Samples');

grid on;
axis tight;
ylim([-1.2 1.2]);