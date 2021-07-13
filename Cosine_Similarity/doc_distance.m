% Cosine Similarity of documents using td-idf vectors

file_1=lower(extractFileText('RedRidingHood.txt'));
file_2=lower(extractFileText('PrincessPea.txt'));
file_3=lower(extractFileText('Cinderella.txt'));
file_4=lower(extractFileText('CAFA1.txt'));
file_5=lower(extractFileText('CAFA2.txt'));
file_6=lower(extractFileText('CAFA3.txt'));

files=[file_1,file_2,file_3,file_4,file_5,file_6];

tdoc=tokenizedDocument(files);
bag=bagOfWords(tdoc);
M=tfidf(bag);

n=length(files);
cs=[];
for i=1:n
    for j=1:n
        a=full(M(i,:));
        b=full(M(j,:));
        sim=max(min(dot(a,b)/(norm(a)*norm(b)),1),-1);
        cs(i,j)=1-sim;
    end
end

YData={'RRH','PPea','Cinde','CAFA1','CAFA2','CAFA3'};
XData={'RRH','PPea','Cinde','CAFA1','CAFA2','CAFA3'};
h=heatmap(XData,YData,cs,'CellLabelColor','none','GridVisible','off');
colormap(gray);
title("Cosine Distance");
%end of script
