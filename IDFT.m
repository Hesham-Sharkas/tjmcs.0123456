function x = IDFT(x_hat)
N = length(x_hat);
k = 0 : N-1;
x = zeros(1,N);
for n = 0 : N-1
    x(n+1) = sum ( x_hat.* exp(1i * 2 * pi * k .* n ./ N ));
end