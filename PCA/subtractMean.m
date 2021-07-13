% WRITE YOU CODE HERE

function [meanSet, means] = subtractMean(M)
    [x,y]=size(M);
    meanSet=[];
    means=[];
    for i=1:y
        means(i)=mean(M(:,i));
        for j=1:x
            meanSet(j,i)=M(j,i)-means(i);
        end
    end
end