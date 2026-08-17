clc;
clear;
close all;

x1 = input("Enter the first sequence x1(n) = ");
x2 = input("Enter the second sequence x2(n) = ");

n1 = -2:(length(x1)-3);
n2 = -1:(length(x2)-2);

ybegin  = n1(1)+n2(1);
yend    = n1(length(x1)) + n2(length(x2));
ny      = [ybegin:yend];

y=conv(x1,x2);

disp("Linear Convolution of x1 and x2 is = ");
disp(y);

subplot(2,2,1);stem(n1,x1);
xlabel("n"); ylabel("x1(n)"); title("Plot of x1");

subplot(2,2,2); stem(n2,x2);
xlabel('n'); ylabel('x2(n)'); title("Plot of x2");

subplot(2,1,2); stem(ny,y);
xlabel('n');ylabel('y(n)'); title("Convolution Output");
