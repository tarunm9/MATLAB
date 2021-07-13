function a = alpha_dynamic(M,p,B,v)
    [N,m] = size(M);
    T = length(v);
    for j = 1:N
        a(j,1) = p(j)*B(j,v(1));
    end
    for t = 2:T
        for j = 1:N
            a(j,t) = B(j,v(t))*sum(a(1:N,t-1).*M(1:N,j));
        end
    end
end