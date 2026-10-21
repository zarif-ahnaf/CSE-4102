clc;
clear;
close all;

x = [1 2 3];
y = [1 2];

Nx = length(x);
Ny = length(y);

z = zeros(1, Nx + Ny - 1);

for n = 1:length(z)
    sum_value = 0;

    for k = 1:Nx

        j = n - k + 1;

        if j >= 1 && j <= Ny
            sum_value = sum_value + x(k) * y(j);
        endif

    endfor

    z(n) = sum_value;
endfor

disp(z);