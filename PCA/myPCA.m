% WRITE YOU CODE HERE

function [eigVec,eigVal] = myPCA(M)
    A=cov(M);
    [V,D]=eig(A);
    [d,ind]=sort(diag(D),'descend');
    eigVal=D(ind,ind);
    eigVec=V(:,ind);
end