clc;
clear;

N = 201;
u_hat = 2*rand(1,N,'double')-1 + 2i*rand(1,N,'double')-1i;
v_hat = 2*rand(1,N,'double')-1 + 2i*rand(1,N,'double')-1i;

n = 1:N;
time_step = 0.0001*pi;       %Decrease the integration step to e.g., 0.01*pi to see the loss in accuracy
time = -pi : time_step : pi-time_step;
time_length = length(time);

f = zeros(1,time_length);
g = zeros(1,time_length);
for time_index = 1:time_length
    f(time_index) = sum(u_hat.*exp(1i.*n.*time(time_index)));
    g(time_index) = sum(v_hat.*exp(1i.*n.*time(time_index)));
end

LHS = sum(f.*g.*conj(f.*g)).*time_step;
RHS = 2*pi*L2_fg(u_hat,v_hat);

fprintf(' Left hand side = %f\n',LHS);
fprintf('Right hand side = %f\n',RHS);