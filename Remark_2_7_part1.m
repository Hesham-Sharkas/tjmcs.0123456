clc;
clear;

N = 265;
u_hat = 2*rand(1,N,'double')-1 + 2i*rand(1,N,'double')-1i;
v_hat = 2*rand(1,N,'double')-1 + 2i*rand(1,N,'double')-1i;

u = IDFT(u_hat)./N;
v = IDFT(v_hat)./N;

LHS = sum(u.*v.*conj(u.*v));
RHS = L2_fg(u_hat,v_hat)./N.^3;

fprintf(' Left hand side = %f\n',LHS);
fprintf('Right hand side = %f\n',RHS);

% Use higher sampling-rate to improve the accuracy of the inverse Fourier
x = 2;
sampling_rate = x*N;
u = ifft(u_hat,sampling_rate);
v = ifft(v_hat,sampling_rate);

LHS = sum(u.*v.*conj(u.*v)).*(sampling_rate./N).^3;

fprintf('\nIncreased sampling-rate for ifft by %d\n',x);
fprintf(' Left hand side = %f\n',LHS);
fprintf('Right hand side = %f\n',RHS);