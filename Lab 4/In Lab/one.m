clc;
clear;
close all;

% Input sequence
x = [1 2 3 4];
L = length(x);
n = 0:L-1;

% Number of DFT points
N = 8;
k = 0:N-1;

% Compute N-point DFT
X = fft(x, N);

% Magnitude and phase spectrum
magX = abs(X);
phaseX = angle(X);

% Compute IDFT
x_idft = ifft(X, N);

% Plot all four graphs
figure;

% 1. Input Sequence
subplot(2,2,1);
stem(n, x, 'filled');
title('Input Sequence');
xlabel('n');
ylabel('x[n]');
grid on;

% 2. Magnitude Spectrum
subplot(2,2,2);
stem(k, magX, 'filled');
title('Magnitude Spectrum');
xlabel('Frequency Index (k)');
ylabel('|X(k)|');
grid on;

% 3. Phase Spectrum
subplot(2,2,3);
stem(k, phaseX, 'filled');
title('Phase Spectrum');
xlabel('Frequency Index (k)');
ylabel('Phase (radians)');
grid on;

% 4. Reconstructed Sequence
subplot(2,2,4);
stem(n, real(x_idft(1:L)), 'filled');
title('Reconstructed Sequence (IDFT)');
xlabel('n');
ylabel('x[n]');
grid on;

% Display results
disp('N-point DFT:');
disp(X);

disp('IDFT reconstructed sequence:');
disp(x_idft);

disp('Original sequence:');
disp(x);

disp('Reconstruction error:');
disp(max(abs(x - x_idft(1:L))));
