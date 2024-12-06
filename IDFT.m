% Written by Hesham Sharkas, on 22 October, 2024
% This code implements IDFT -NOT Weighted- used in theorems and corollaries
% in the open access article DOI: http://dx.doi.org/10.47000/tjmcs.1424850

function x = IDFT(x_hat)
N = length(x_hat);
k = 0 : N-1;
x = zeros(1,N);
for n = 0 : N-1
    x(n+1) = sum ( x_hat.* exp(1i * 2 * pi * k .* n ./ N ));
end