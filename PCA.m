% WRITE YOU CODE HERE

%PCA-Part 1
%step 1
toy=load('pcadata.mat','X');
X=toy.X;
%step 2
xmin=0;
xmax=7;
ymin=2;
ymax=8;
figure('Name','Figure A');
scatter(X(:,1),X(:,2),'o','b');
axis([xmin xmax ymin ymax]);
box on;
hold on;
%step 3
[Xmu,mu]=subtractMean(X);
%step 4
[U,S]=myPCA(Xmu);
%step 5
fprintf("Coordinates of the top eigenvector: (%f,%f) (%f,%f)\n",...
    mu(1),mu(2),mu(1)+U(1,1),mu(2)+U(2,1));
plot([mu(1) mu(1)+U(1,1)],[mu(2) mu(2)+U(2,1)],'r-','LineWidth',2.5);
plot([mu(1) mu(1)+U(1,2)],[mu(2) mu(2)+U(2,2)],'g-','LineWidth',2.5);
title("Datapoints and their 2 principal components");
hold off;
%step 6
K=1;
Z=projectData(Xmu,U,K);
%step 7
disp(Z(1:3,:));
%step 8
Xrec=recoverData(Z,U,K,mu);
%step 9
figure('Name','Figure B');
scatter(X(:,1),X(:,2),'o','b');
axis([xmin xmax ymin ymax]);
box on;
hold on;
scatter(Xrec(:,1),Xrec(:,2),50,'*','r');
title("Datapoints and their reconstruction");
hold off;
%end of script for part 1
%-----
%PCA-Part 2
%step 1
faces=load('pcafaces.mat','X');
X=faces.X;
%step 2
figure('Name','Figure C');
displayData(X(1:100,:));
%step 3
[Xmu,mu]=subtractMean(X);
%step 4
[U,S]=myPCA(Xmu);
K=200;
Z=projectData(Xmu,U,K);
%step 5
Xrec=recoverData(Z,U,K,mu);
%step 6
figure('Name','Figure D');
subplot(1,2,1);
displayData(X(1:100,:));
title("Original faces");
hold on;
subplot(1,2,2);
displayData(Xrec(1:100,:));
title("Recovered faces");
hold off;
%end of script for part 2
