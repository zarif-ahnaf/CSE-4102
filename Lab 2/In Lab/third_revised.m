  clc;
  clear;
  close all;

  % Input 2D matrices (images / spatial signals)
  A = input("Enter the first 2D matrix A = ");
  H = input("Enter the second 2D matrix H (kernel) = ");

  [rA, cA] = size(A);
  [rH, cH] = size(H);

  % Flip the kernel 180 degrees for true 2D convolution (transposed feel)
  H_flipped = rot90(H, 2);

  % Output dimensions for full 2D convolution
  rOut = rA + rH - 1;
  cOut = cA + cH - 1;

  % Zero-pad matrix A to handle boundaries
  padA = zeros(rA + 2*(rH - 1), cA + 2*(cH - 1));
  padA(rH : rH + rA - 1, cH : cH + cA - 1) = A;

  % Initialize output matrix C
  C = zeros(rOut, cOut);

  % Manual 2D convolution using 4 nested for-loops
  for i = 1 : rOut
      for j = 1 : cOut
          sum_val = 0;
          for p = 1 : rH
              for q = 1 : cH
                  sum_val = sum_val + padA(i + p - 1, j + q - 1) * H_flipped(p, q);
              endfor
          endfor
          C(i, j) = sum_val;
      endfor
  endfor

  disp("2D Convolution output C is = ");
  disp(C);

  % Visualization using subplots and image plots
  figure;

  subplot(2, 2, 1);
  imagesc(A);
  colorbar;
  xlabel('Columns');
  ylabel('Rows');
  title('Matrix A');

  subplot(2, 2, 2);
  imagesc(H);
  colorbar;
  xlabel('Columns');
  ylabel('Rows');
  title('Kernel H');

  subplot(2, 1, 2);
  imagesc(C);
  colorbar;
  xlabel('Columns');
  ylabel('Rows');
  title('2D Convolution Output C');
