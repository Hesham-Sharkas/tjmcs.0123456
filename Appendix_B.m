clc;
clear;

N = 256;
u = 2*rand(1,N,'double')-1 + 2i*rand(1,N,'double')-1i;
v = 2*rand(1,N,'double')-1 + 2i*rand(1,N,'double')-1i;

u_hat = DFT(u)./sqrt(N);
v_hat = DFT(v)./sqrt(N);

LHS = CyclixConvolution(u_hat,v_hat);
RHS = sqrt(N) .* DFT(u.*v)./sqrt(N);

display_output_nicely = zeros(N,2);
display_output_nicely(:,1) = transpose(LHS);
display_output_nicely(:,2) = transpose(RHS);

disp(display_output_nicely);