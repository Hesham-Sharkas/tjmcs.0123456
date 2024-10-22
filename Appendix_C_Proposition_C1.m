clc;
clear;

N = 64;
u = 2*rand(1,N,'double')-1 + 2i*rand(1,N,'double')-1i;
v = 2*rand(1,N,'double')-1 + 2i*rand(1,N,'double')-1i;

r_N = CyclicConvolution(u,v);
r = LinearConvolution(u,v);

r_1 = r(1:N);
r_2 = [r(N+1:2*N-1) 0];

% Check the relation that r_N = r_1 + r_2 using absolute error (AE).
% If AE = 0, then the two sides of the relation are identical.
fprintf('\nVerify the relation r_N = r_1 + r_2\n');
AE = sum(  abs(r_N - (r_1 + r_2) )  );
fprintf(' Absolute Error = %f\n',AE);

% Check the relation given in Equation C.1
fprintf('\nVerify Equation C.1\n');
LHS = sum(r_N);
RHS = sum(r);
fprintf(' Left hand side = %f\n',LHS);
fprintf('Right hand side = %f\n',RHS);

% Check the relation given in Equation C.2
fprintf('\nVerify Equation C.2\n');
LHS = sum(sum(r_N' * r_N));
RHS = sum(sum(r' * r));
fprintf(' Left hand side = %f\n',LHS);
fprintf('Right hand side = %f\n',RHS);