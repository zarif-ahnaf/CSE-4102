clc;
clear;
close all;
x = [1 2 3]
h = [1 2 1]

N = length(x)+length(h) - 1

disp(x)

disp(h)

y1 = conv(x,h);

disp(y1);

xp = [x zeros(1,N-length(x))]
hp = [h zeros(1,N-length(h))]

X = fft(xp,N)
H = fft(hp,N)

Y = X .*H
y2 = real(ifft(Y,N))


subplot(2,2,1);
stem(0:length(x)-1,x,'b','filled')
title('Original Sequence x(n)');
xlabel('n'); ylabel('Amplitude');
grid on;


subplot(2,2,2);
stem(0:length(h)-1,h,'b','filled')
title('Original Sequence h(n)');
xlabel('n'); ylabel('Amplitude');
grid on;


subplot(2,2,3);
stem(0:N-1,y1,'b','filled')
title('Linear Convolution (Direct Method)');
xlabel('n'); ylabel('Amplitude');
grid on;

subplot(2,2,4);
stem(0:N-1,y2,'filled','Color','#005B3A')
title('DFT-IDFT Convolution');
xlabel('n');
ylabel('Amplitude');
grid on;