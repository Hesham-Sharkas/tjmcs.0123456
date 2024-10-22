function out = CyclicConvolution(u,v)
L_u = length(u);
L_v = length(v);

if L_u~=L_v
    error('The two input vectors must have the same dimension!');
end

v = [v v];
v = fliplr(v);
out = zeros(1,L_u); %pre-allocation
for i=0:L_u-1
    out(1,i+1) = sum(u.*v(L_u-i:(2*L_u) - 1 - i));
end
end