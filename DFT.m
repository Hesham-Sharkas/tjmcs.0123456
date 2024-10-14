function x_hat = DFT(x)
N = length(x);
n = 0 : N-1;
x_hat = zeros(1,N);
for k = 0 : N-1
    x_hat(k+1) = sum ( x.* exp(-1i * 2 * pi * k .* n ./ N ));
end
