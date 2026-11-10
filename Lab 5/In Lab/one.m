clc; clear; close all;

x = input('Enter the Sequence x(n) = ');
h = input('Enter the Sequence h(n) = ');

N = length(x) + length(h) - 1;

% Original sequences
disp('Original Sequence x(n):');
disp(x);

disp('Original Sequence h(n):');
disp(h);

% Direct linear convolution
y1 = conv(x, h);

disp('Linear Convolution using Direct Method:');
disp(y1);

% DFT and IDFT method
xp = [x zeros(1, N-length(x))];
hp = [h zeros(1, N-length(h))];

X = fft(xp, N);
H = fft(hp, N);

Y = X .* H;
y2 = real(ifft(Y, N));

disp('Linear Convolution using DFT and IDFT:');
disp(y2);

% Plotting
figure;

subplot(2,2,1);
stem(0:length(x)-1, x, 'b', 'filled');
title('Original Sequence x(n)');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(2,2,2);
stem(0:length(h)-1, h, 'b', 'filled');
title('Original Sequence h(n)');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(2,2,3);
stem(0:N-1, y1, 'r', 'filled');
title('Linear Convolution (Direct Method)');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(2,2,4);
stem(0:N-1, y2, 'filled', 'Color', '#005B3A');
title('DFT-IDFT Convolution');
xlabel('n');
ylabel('Amplitude');
grid on;