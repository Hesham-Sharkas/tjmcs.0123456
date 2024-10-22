function out = LinearConvolution(u,v)
ul = length(u);
vl = length(v);

u = [u, zeros(1,vl-1)]; 
v = [v, zeros(1,ul-1)];
out = zeros(1,ul+vl-1); %pre-allocation
for k=1:ul+vl-1 
    out(1,k) = sum(u(1,1:k).*fliplr(v(1,1:k)));
end
end