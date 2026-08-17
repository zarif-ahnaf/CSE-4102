clc;
clear;
close all;

x1 = input("Enter the first sequence x1(n) = ");
x2 = input("Enter the second sequence x2(n) = ");

y = conv(x1, x2);

disp("Linear convolution of x1 and x2 is = ");
disp(y);

% Plot
subplot(2,2,1);
stem(x1);
xlabel('n');
ylabel('x1(n)');
title('Plot of x1(n)');

subplot(2,2,2);
stem(x2);
xlabel('n');
ylabel('x2(n)');
title('Plot of x2(n)');

subplot(2,1,2);
stem(y);
xlabel('n');
ylabel('y(n)');
title('Convolution Output');
