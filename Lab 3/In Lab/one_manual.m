clc;
clear all;
close all;

x = input('Enter the Sequence x(n) = ');
y = input('Enter the Sequence y(n) = ');

N = length(x);

% Lag range
lags = -(N-1):(N-1);

% Cross-correlation
rxy = zeros(1, 2*N-1);

for k = 1:length(lags)

    l = lags(k);
    sum_value = 0;

    for n = 1:N
        m = n + l;
        if m >= 1 && m <= N
            sum_value = sum_value + x(n) * y(m);
        endif
    endfor
    rxy(k) = sum_value;
endfor

disp('Cross Correlation is = ');
disp(rxy);

disp('Lag is = ');
disp(lags);

subplot(2,1,1);
stem(0:N-1, x);
xlabel('n');
ylabel('x(n)');
title('Sequence x(n)');
grid on;

subplot(2,1,2);
stem(lags, rxy);
xlabel('Lag');
ylabel('Rxy');
title('Cross Correlation');
grid on;