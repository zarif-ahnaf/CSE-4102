clc;
clear;
close all;

x = [1 2 3 4]
L = length(x);
n = 0:L-1;

N = 8
k = 0:N-1;

X = fft(x,N);

magX = abs(X);
phaseX = angle(X);

x_idft = ifft(X,N);

figure;

subplot(2,2,1);
stem(n,x,'filled');
title("Input Sequence");
xlabel('n');
ylabel('x[n]');
grid on;

subplot(2,2,2);
stem(k,magX,'filled')
title("magnitude spectrum");
xlabel("Frequncy Index (k)")
ylabel("|X(k)|")
grid on;


subplot(2,2,3)
stem(k,phaseX,'filled');
title("Phrase Spectrum")
xlabel("Frequency Index (K)")
ylabel("Phase (radians)")
grid on;

subplot(2,2,4)
stem(n,real(x_idft(1:L)),'filled')
title("Reconstructed Sequence (IDFT)")
xlabel("n")
ylabel("x[n]")
grid on;

disp("N Point DFT")
