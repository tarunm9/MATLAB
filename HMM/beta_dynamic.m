function b = beta_dynamic(M,p,B,v)
    [N,m] = size(M);
    T = length(v);
    b = ones(N,T);
    for t = T-1:-1:1
        for i = 1:N
            b(i,t) = 0;
            for j = 1:N                
                b(i,t) = b(i,t)+b(j,t+1)*M(i,j)*B(j,v(t+1));
            end
        end
    end
end