function g = gamma_dynamic(alpha,beta)
    [N,T] = size(alpha);
    g = zeros(N,T);
    for t = 1:T
        for i = 1:N
            g(i,t) = (alpha(i,t)*beta(i,t))/sum(alpha(1:N,t).*beta(1:N,t));
        end
    end
end