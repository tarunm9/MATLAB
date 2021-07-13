# Experts predictions using Aggregating Algorithm on tennis bookmakers dataset

Real-data example about bookmakers’ odds is taken from V.Vovk and F.Zhdanov, Prediction with expert advice for the Brier game.

Bookmakers quote betting odds for a sports event. One may interpret those as probabilities that one side will win.

In fact the situation is a bit more complicated: bookmakers are interested in making money rather than accurate predictions so they always include a margin to guarantee themselves a profit. However we ignore that and interpret their odds as a prediction.

The format of the file is as follows. Each line describes a game. The first number is an ID with the technical information about the game; you may ignore it. The second number shows whether player 1 won; it is always 1 because players were re-ordered this way retrospectively. The third column shows whether player 2 won; it is always 0 for the same reason.

The rest of the line contains “predictions” made by four bookmakers.
The fourth column is the estimate done by the first bookmaker whether player 1 would win; the fifth is the estimate by the first bookmaker that player 2 would win.
They sum up to 1. Ignoring the fifth number and treat the fourth as prediction in the square loss game.
The sixth and seventh columns contain predictions by the second bookmaker, the eighth and ninth by the third, and the tenth and eleventh by the fourth.

Processing the dataset and running the function on the predictions by four bookmakers to get the Aggregating Algorithm predictions.

The first grapgh shows five cumulative losses vs. time, LossE1(t), LossE2(t),LossE3(t), LossE4(t) of the experts and LossL(t) of the Aggregating Algorithm.
![image](https://user-images.githubusercontent.com/43922347/125490770-e015523b-287f-4e18-b719-01e246a5fdca.png)

The second graph shows the following four differences vs. time: LossE1(t)−LossL(t), LossE2(t)−LossL(t), LossE3(t)−LossL(t), LossE4(t)−LossL(t).
![image](https://user-images.githubusercontent.com/43922347/125490822-0dcace0d-c361-4440-b36a-c669552fbec8.png)

The third graph shows the following four differences vs. time: LossE1(t) − Lossave(t), LossE2(t) − Lossave(t), LossE3(t) − Lossave(t), LossE4(t) − Lossave(t), where Lossave(t) is the cumulative loss of the following simple strategy. On every steps it takes the predictions of experts E1, E2, E3, and E4 and averages them with equal weights 1/4: γt = (1/4)*(γ1t + γ2t + γ3t + γ4t).
![image](https://user-images.githubusercontent.com/43922347/125490862-1acf44e1-0819-4469-94cd-acd360b40606.png)
