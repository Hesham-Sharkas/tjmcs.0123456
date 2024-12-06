% Written by Hesham Sharkas, on 22 October, 2024
% This code implements DFT -NOT Weighted- used in theorems and corollaries
% in the open access article DOI: http://dx.doi.org/10.47000/tjmcs.1424850

function x_hat = DFT(x)
N = length(x);
n = 0 : N-1;
x_hat = zeros(1,N);
for k = 0 : N-1
    x_hat(k+1) = sum ( x.* exp(-1i * 2 * pi * k .* n ./ N ));
end
