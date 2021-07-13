% Aggregating Algorithm with Sleeping Experts on tennis bookmakers dataset

% Loading the data
tennis1 = dlmread('tennis1.txt');
% Feeding the experts predictions
expertsPredictions = tennis1(:,[4 6 8 10])';
[N,T] = size(expertsPredictions);
outcomes = tennis1(:,2)';
% Specialist Experts where Expert 4 is sleeping at steps of 5
expertsPredictions(4,5:5:T) = 0;
% Sleeping experts prediction
predictions = AA_sleeping(expertsPredictions,outcomes);
% Total Loss of AA with specialist experts:
ourLoss = (outcomes-predictions).^2;
disp("Total Loss of AA:");
disp(sum(ourLoss));
% Aggregating Algorithm with sleeping experts
function predictions = AA_sleeping(expertsPredictions,outcomes)
    [N,T] = size(expertsPredictions);
    weights = ones(N,T+1);
    p = zeros(N,T+1);
    predictions = [];
    eta = 2;
    for t = 1:T
        for n = 1:N
            p(n,t) = weights(n,t)/sum(weights(1:N,t));
        end
 % Specialist Experts where Expert 4 is sleeping at steps of 5
        for i = 5:5:T
            p(4,i) = 0;
        end
        g0 = -(1/eta)*log(sum(p(1:N,t).*exp(-eta.*(expertsPredictions(1:N,t).^2))));
        g1 = -(1/eta)*log(sum(p(1:N,t).*exp(-eta.*(1-expertsPredictions(1:N,t)).^2)));
        gamma = 0.5-((g1-g0)/2);
        predictions(t)= gamma;
        for n = 1:3
            lambda = (outcomes(t)-expertsPredictions(n,t))^2;
            weights(n,t+1) = p(n,t)*exp(-eta*lambda);
        end
        if mod(t,5) == 0
            lambda = (outcomes(t)-gamma)^2;
            weights(4,t+1) = p(4,t)*exp(-eta*lambda);
        else
            lambda = (outcomes(t)-expertsPredictions(4,t))^2;
            weights(4,t+1) = p(4,t)*exp(-eta*lambda);
        end
        
    end
end
