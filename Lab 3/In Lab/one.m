clc;
clear;
close all;

%% 1. Create the original signal
fs = 1000;              % Sampling frequency (Hz)
t = 0:1/fs:1;           % 1 second

x = sin(2*pi*10*t);     % 10 Hz sine wave

%% 2. Create a delayed version of the signal
delay_samples = 150;    % Delay by 150 samples

y = [zeros(1, delay_samples), x(1:end-delay_samples)];

%% 3. Calculate cross-correlation
[r, lags] = xcorr(x, y);

%% 4. Find the peak correlation
[~, index] = max(r);

estimated_delay = lags(index);

%% 5. Display results
fprintf('Actual delay:    %d samples\n', delay_samples);
fprintf('Estimated lag:   %d samples\n', estimated_delay);

fprintf('Delay in seconds: %.4f seconds\n', ...
    abs(estimated_delay) / fs);

%% 6. Plot original and delayed signals
figure;

subplot(2,1,1);
plot(t, x);
hold on;
plot(t, y);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Original and Delayed Signals');
legend('x', 'y');
grid on;

%% 7. Plot cross-correlation
subplot(2,1,2);
plot(lags, r);
hold on;
plot(estimated_delay, r(index), 'ro', 'MarkerSize', 8);

xlabel('Lag (samples)');
ylabel('Cross-correlation');
title('Cross-Correlation');
grid on;

fprintf('\nPeak correlation occurs at lag = %d samples.\n', ...
    estimated_delay);