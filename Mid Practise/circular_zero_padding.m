x = [1 2 3];
y = [1 2];

N = max(length(x), length(y));

x = [x zeros(1, N-length(x))];
y = [y zeros(1, N-length(y))];

z = zeros(1, N);

for n = 1:N
    for k = 1:N
        index = mod(n-k, N) + 1;
        z(n) = z(n) + x(k) * y(index);
    end
end

disp(z);
