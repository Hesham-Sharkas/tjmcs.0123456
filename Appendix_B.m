clc;
clear;

N = 64;
u = 2*rand(1,N,'double')-1 + 2i*rand(1,N,'double')-1i;
v = 2*rand(1,N,'double')-1 + 2i*rand(1,N,'double')-1i;

u_hat = DFT(u)./sqrt(N);
v_hat = DFT(v)./sqrt(N);

%Convolution theorem form 1. This is the form in Appendix B in the article.
LHS = CyclicConvolution(u_hat,v_hat);
RHS = sqrt(N) .* DFT(u.*v)./sqrt(N);

%Convolution theorem form 2. This is the other well-known form of the theorem.
LHS_2 = sqrt(N) .* u_hat .* v_hat;
RHS_2 = DFT(CyclicConvolution(u,v)) ./ sqrt(N);

display_output_nicely = zeros(N,2);
display_output_nicely(:,1) = transpose(LHS);
display_output_nicely(:,2) = transpose(RHS);

disp('Convolution theorem formula 1')
disp(display_output_nicely);  %The output is shown in two parralel coloumns. Compare each cell to the one next to it.

display_output_nicely(:,1) = transpose(LHS_2);
display_output_nicely(:,2) = transpose(RHS_2);
disp('Convolution theorem formula 2')
disp(display_output_nicely);  %The output is shown in two parralel coloumns. Compare each cell to the one next to it.