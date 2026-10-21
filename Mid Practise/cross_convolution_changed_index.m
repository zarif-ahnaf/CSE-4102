clc;
clear;
close all;

x = input('Enter the Sequence x(n) = ');
y = input('Enter the Sequence y(n) = ');

N = length(x);
M = length(y);

% Lag range
lags = -(M-1):(N-1);

% Cross-correlation
rxy = zeros(1, N+M-1);

for k = 1:length(lags)

    l = lags(k);
    sum_value = 0;

    for n = 1:N

        m = n - l;

        if m >= 1 && m <= M
            sum_value = sum_value + x(n) * y(m);
        endif

    endfor

    rxy(k) = sum_value;

endfor

disp('Cross Correlation is = ');
disp(rxy);

disp('Lag is = ');
disp(lags);

subplot(3,1,1);
stem(0:N-1, x);
xlabel('n');
ylabel('x(n)');
title('Input Sequence x(n)');
grid on;

subplot(3,1,2);
stem(0:M-1, y);
xlabel('n');
ylabel('y(n)');
title('Input Sequence y(n)');
grid on;

subplot(3,1,3);
stem(lags, rxy);
xlabel('Lag');
ylabel('Rxy');
title('Cross Correlation');
grid on;