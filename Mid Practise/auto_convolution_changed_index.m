clc;
clear;
close all;

x = [1 2 3];

% Changed index of x(n)
nx = -1:1;

N = length(x);

% Auto-convolution output
z = zeros(1, 2*N-1);

for i = 1:N
    for j = 1:N

        index = i + j - 1;

        z(index) = z(index) + x(i) * x(j);

    endfor
endfor

% Output index
nz_start = nx(1) + nx(1);
nz = nz_start : nz_start + length(z) - 1;

disp("Index n:");
disp(nz);

disp("Auto-convolution:");
disp(z);