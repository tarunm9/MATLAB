% Loading the data
tennis1 = dlmread('tennis1.txt');
% Feeding the experts predictions
expertsPredictions = tennis1(:,[4 6 8 10])';
[N,T] = size(expertsPredictions);
% Feeding thr outcomes
outcomes = tennis1(:,2)';
% Prediction using Aggregating Algorithm for binary square loss (Brier)
predictions = AA_Brier(expertsPredictions,outcomes);
% Square-Loss (Brier) game lambda(gamma,omega)=(omega-gamma)^2
expertsLoss = (expertsPredictions-repmat(outcomes,N,1)).^2;
ourLoss = (outcomes-predictions).^2;
% Total Loss of AA:
disp("Total Loss of AA:");
disp(sum(ourLoss));
% First Graph: Loss(E1,t),Loss(E2,t),Loss(E3,t),Loss(E4,t) and Loss(AA,t)
rect = [0.17, 0.7, 0.2, 0.2];
figure('Name','First Graph');
plot(1:T,cumsum(expertsLoss(1,:)),1:T,cumsum(expertsLoss(2,:)));
title('First Graph: Cumulative Losses vs. Time')
hold on;
plot(1:T,cumsum(expertsLoss(3,:)),1:T,cumsum(expertsLoss(4,:)));
plot(1:T,cumsum(ourLoss));
h=legend("Expert 1","Expert 2","Expert 3","Expert 4","Learner's Loss")
xlabel("Time")
ylabel("Cummulative Loss")
set(h, 'Position', rect)
hold off;
% Second Graph:
rect = [0.21, 0.7, 0.2, 0.2];
figure('Name','Second Graph');
plot(1:T,cumsum(expertsLoss(1,:)-ourLoss));
title('Second Graph: Differences vs. Time')
hold on;
plot(1:T,cumsum(expertsLoss(2,:)-ourLoss));
plot(1:T,cumsum(expertsLoss(3,:)-ourLoss));
plot(1:T,cumsum(expertsLoss(4,:)-ourLoss));
h=legend("Loss(E1)-Loss(Learner)","Loss(E2)-Loss(Learner)","Loss(E3)-Loss(Learner)","Loss(E4)-Loss(Learner)")
xlabel("Time")
ylabel("Cummulative Loss Difference")
set(h, 'Position', rect)
hold off;
% Third Graph:
rect = [0.21, 0.75, 0.15, 0.15];
avgLoss = 0.25*(expertsLoss(1,:)+ expertsLoss(2,:)+ expertsLoss(3,:)+ expertsLoss(4,:));
figure('Name','Third Graph');
plot(1:T,cumsum(expertsLoss(1,:)-avgLoss));
title('Third Graph: Differnces vs. Time')
hold on;
plot(1:T,cumsum(expertsLoss(2,:)-avgLoss));
plot(1:T,cumsum(expertsLoss(3,:)-avgLoss));
plot(1:T,cumsum(expertsLoss(4,:)-avgLoss));
h=legend("Loss(E1)-Loss(Ave)","Loss(E2)-Loss(Ave)","Loss(E3)-Loss(Ave)","Loss(E4)-Loss(Ave)")
xlabel("Time")
ylabel("Cummulative Loss Difference")
set(h, 'Position', rect)
hold off;