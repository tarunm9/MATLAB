function mismatch(M,p,B,v)
    [N,l] = size(M);
    T = 5;
    %T = length(v);
    rng(1);
    vec = randi([1 4],1024,T);
    m = 0;
    for i = 1:1024
        vtrb(i,:) = viterbi(M,p,B,vec(i,:),N,T);
        fwbw(i,:) = forward_backword(M,p,B,vec(i,:),N,T);
        if  isequal(vtrb(i),fwbw(i))
        else
            m = m + 1;
        end
    end
    disp("The number of mismatched h in Viterbi and Forward-Backword is:");
    disp(m);
    %disp("Viterbi approach:");
    %disp(viterbi(M,p,B,v,N,T));
    %disp("Forward-Backword approach:");
    %disp(forward_backword(M,p,B,v,N,T));
end
function h = viterbi(M,p,B,v,N,T)
    w = zeros(N,T);
    w(1:N,1) = p.*B(1:N,v(1));
    h = zeros(1,T);
    prev = zeros(N,T-1);
    for t = 2:T
        for j = 1:N
            [val,idx] = max(w(1:N,t-1).*M(1:N,j));
            prev(j,t-1) = idx;
            w(j,t) = B(j,v(t))*val;
        end
    end
    [valv,h(T)] = max(w(1:N,end));
    for k = 1:T-1
        h(k) = prev(h(T),k);
    end
end
function h = forward_backword(M,p,B,v,N,T)
    alpha = alpha_dynamic(M,p,B,v);
    beta = beta_dynamic(M,p,B,v);
    gamma = gamma_dynamic(alpha,beta);
    h = zeros(1,T);
    for t = 1:T
        [valfb,h(t)] = max(gamma(1:N,t));
    end
end