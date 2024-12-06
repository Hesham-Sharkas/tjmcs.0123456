% Written by Hesham Sharkas, on 22 October, 2024
% This code implements Corollary 2.4, introduced in the open access article
% DOI: http://dx.doi.org/10.47000/tjmcs.1424850

clc;
clear;

N = 200;
u_hat = 2*rand(1,N,'double')-1 + 2i*rand(1,N,'double')-1i;

u = IDFT(u_hat)./sqrt(N);

LHS = sum(u.*u.*conj(u.*u));
RHS = L2_fg(u_hat,u_hat)./N;

fprintf(' Left hand side = %f\n',LHS);
fprintf('Right hand side = %f\n',RHS);

% Use higher sampling-rate to improve the accuracy of the inverse Fourier
sampling_rate = 10*N;
u = ifft(u_hat,sampling_rate).*sqrt(sampling_rate);

LHS = sum(u.*u.*conj(u.*u)).*sampling_rate./N;
RHS = L2_fg(u_hat,u_hat)./N;

fprintf('\nIncreased sampling-rate for ifft by 10\n');
fprintf(' Left hand side = %f\n',LHS);
fprintf('Right hand side = %f\n',RHS);