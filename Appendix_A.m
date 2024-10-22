clc;
clear;

N = 1000;
x_n = 2*rand(1,N,'double')-1 + 2i*rand(1,N,'double')-1i;
x_k = DFT(x_n)./sqrt(N);

LHS = sum(x_n .* conj(x_n));
RHS = sum(x_k .* conj(x_k));

fprintf(' Left hand side = %f\n',LHS);
fprintf('Right hand side = %f\n',RHS);