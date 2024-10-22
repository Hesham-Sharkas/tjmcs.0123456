clc;
clear;

N = 201;
u = 2*rand(1,N,'double')-1 + 2i*rand(1,N,'double')-1i;
v = 2*rand(1,N,'double')-1 + 2i*rand(1,N,'double')-1i;

n = 1:N;
angular_frequency_step = 0.0001*pi;       %Decrease the integration step to e.g., 0.01*pi to see the loss in accuracy
angular_frequency = -pi : angular_frequency_step : pi-angular_frequency_step;
angular_frequency_length = length(angular_frequency);

f_hat = zeros(1,angular_frequency_length);
g_hat = zeros(1,angular_frequency_length);
for angular_frequency_index = 1:angular_frequency_length
    f_hat(angular_frequency_index) = sum(u.*exp(-1i.*n.*angular_frequency(angular_frequency_index)));
    g_hat(angular_frequency_index) = sum(v.*exp(-1i.*n.*angular_frequency(angular_frequency_index)));
end

LHS = sum(f_hat.*g_hat.*conj(f_hat.*g_hat)).*angular_frequency_step;
RHS = 2*pi*L2_fg(u,v);

fprintf(' Left hand side = %f\n',LHS);
fprintf('Right hand side = %f\n',RHS);