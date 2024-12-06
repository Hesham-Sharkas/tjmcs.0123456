% Written by Hesham Sharkas, on 22 October, 2024
% This code implements Theorem 2.3, introduced in the open access article
% DOI: http://dx.doi.org/10.47000/tjmcs.1424850

clc;
clear;

N = 200;
u_hat = 2*rand(1,N,'double')-1 + 2i*rand(1,N,'double')-1i;
v_hat = 2*rand(1,N,'double')-1 + 2i*rand(1,N,'double')-1i;

u = IDFT(u_hat)./sqrt(N);
v = IDFT(v_hat)./sqrt(N);

LHS = sum(u.*v.*conj(u.*v));
RHS = L2_fg(u_hat,v_hat)./N;

fprintf(' Left hand side = %f\n',LHS);
fprintf('Right hand side = %f\n',RHS);

% Use higher sampling-rate to improve the accuracy of the inverse Fourier
x = 5;
sampling_rate = x*N;
u = ifft(u_hat,sampling_rate).*sqrt(sampling_rate);
v = ifft(v_hat,sampling_rate).*sqrt(sampling_rate);

LHS = sum(u.*v.*conj(u.*v)).*sampling_rate./N;

fprintf('\nIncreased sampling-rate for ifft by %d\n',x);
fprintf(' Left hand side = %f\n',LHS);
fprintf('Right hand side = %f\n',RHS);