clc;
clear;
close all;

x = [1 2 3 4];
L = length(x);
n = 0:L-1;

N = 8;
k= 0:N-1;

X = fft(x,N);
magX = abs(X);
phaseX = angle(X);

x_idft = ifft(X,N);

subplot(2,2,1)
stem(n,x, 'filled')
title("Input sequence")
xlabel("n");
ylabel("x[n]");
grid on;

subplot(2,2,2)
stem(k,magX,'filled')
title("Magnitude Spectrum");
xlabel("Frequency Index (K)")
ylabel("|X(k)|")
grid on;


subplot(2,2,4)
stem(n,real(x_idft(1:L)),'filled')

disp('IDFT reconstructed sequence:');
disp(x_idft);

disp('Original sequence:');
disp(x);

disp("Reconstruction error:")
disp(max(abs(x-x_idft(1:L))))