clc;
clear;
close all;

x = [1 2 3]
h = [1 2 1]

N = length(x)+length(h) - 1

y1 = conv(x,h);

xp = [x zeros(1,N-length(x))]
hp = [h zeros(1,N-length(h))]

X = fft(xp,N)
H = fft(hp,N)

Y = X .* H;
y2 = real(ifft(Y,N))

subplot(2,2,1)
title("Original Sequence x(n)")
stem(0:length(x)-1,x,'b','filled')
title("Original Sequence x(n)")
grid on;


subplot(2,2,2)
title("Original Sequence x(n)")
stem(0:length(h)-1,h,'b','filled')
grid on;


subplot(2,2,3)
stem(0:N-1,y1,'r','filled')
title("Linear convolution (direct method)")
grid on;


subplot(2,2,4)
stem(0:N-1,y2,'r','filled')
title("Linear convolution (direct method)")
grid on;