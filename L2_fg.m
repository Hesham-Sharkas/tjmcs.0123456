% Written by Hesham Sharkas, on 22 October, 2024
% This code implements formula appears in RHS of equations (2.3) and (2.7)
% in the open access article DOI: http://dx.doi.org/10.47000/tjmcs.1424850

function out = L2_fg(u,v)
N = length(u);
L = length(v);

if N~=L
    error('The two input vectors must have the same dimension!');
end

out_m = 0;
out_n = 0;
for n = 1 : N
    for m = 1 : N
        if n>=m
            n_m = n - m;
            l = 1 + n_m : N;
            out_l = sum( conj(v(l)) .* v(l-n_m) );
        else
            m_n = m - n;
            l = 1 + m_n : N;
            out_l = sum( conj(v(l-m_n)) .* v(l) );
        end
        out_m = out_m + ( conj(u(m)) .* out_l );
    end
    out_n = out_n + ( u(n) .* out_m);
    out_m = 0;
end
out = out_n;
end