% Written by Hesham Sharkas, on 22 October, 2024
% This code implements Corollary 2.6, introduced in the open access article
% DOI: http://dx.doi.org/10.47000/tjmcs.1424850

clc;
clear;

N = 256;
u = 2*rand(1,N,'double')-1 + 2i*rand(1,N,'double')-1i;

u_hat = DFT(u)./sqrt(N);

LHS = sum(u_hat.*u_hat.*conj(u_hat.*u_hat));
RHS = L2_fg(u,u)./N;

fprintf(' Left hand side = %f\n',LHS);
fprintf('Right hand side = %f\n',RHS);

% Use higher sampling-rate to improve the accuracy of the Fourier transform
x = 2;
sampling_rate = x*N;
u_hat = fft(u,sampling_rate)./sqrt(sampling_rate);

LHS = sum(u_hat.*u_hat.*conj(u_hat.*u_hat)).*sampling_rate./N;

fprintf('\nIncreased sampling-rate for fft by %d\n',x);
fprintf(' Left hand side = %f\n',LHS);
fprintf('Right hand side = %f\n',RHS);