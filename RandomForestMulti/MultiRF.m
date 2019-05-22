% https://www.mathworks.com/help/stats/select-predictors-for-random-forests.html
tic
clc; clear all
data=xlsread('dataset 4.5.xlsx');
AtmosLossdB=data(1:end-1,3);
RainLossdB = data(1:end-1,4);
CloudsFogLossdB = data(1:end-1,5);
FreqDopplerShiftkHz = data(1:end-1,7);

CNdB = data(1:end-1,12);

load carbig
Cylinders = categorical(Cylinders);
Model_Year = categorical(Model_Year);
Origin = categorical(cellstr(Origin));
% X = table(Cylinders,Displacement,Horsepower,Weight,Acceleration,Model_Year,Origin);

X = table(AtmosLossdB,RainLossdB,CloudsFogLossdB,FreqDopplerShiftkHz);
str = ["AtmosLossdB","RainLossdB","CloudsFogLossdB","FreqDopplerShiftkHz"];
countLevels = categories(categorical(str));
C=categorical(str)%%%%%%%%%      ????????????
func=@(x)numel(str)%%%%%%%%%     ????????????
numLevels = varfun(func,X,'OutputFormat','uniform');
 
% figure
% bar(numLevels)
% title('Number of Levels Among Predictors')
% xlabel('Predictor variable')
% ylabel('Number of levels')
% h = gca;
% h.XTickLabel = X.Properties.VariableNames(1:end-1);
% h.XTickLabelRotation = 45;
% h.TickLabelInterpreter = 'none';
 
% t = templateTree('NumVariablesToSample','all',...
%      'PredictorSelection','interaction-curvature','Surrogate','on');
% rng(1); % For reproducibility
% Mdl = fitrensemble(X,MPG,'Method','Bag','NumLearningCycles',200, ...
%  'Learners',t);
% 
% yHat = oobPredict(Mdl);
% R2 = corr(Mdl.Y,yHat)^2
% 
% 
% impOOB = oobPermutedPredictorImportance(Mdl);
% figure
% bar(impOOB)
% title('Unbiased Predictor Importance Estimates')
% xlabel('Predictor variable')
% ylabel('Importance')
% h = gca;
% h.XTickLabel = Mdl.PredictorNames;
% h.XTickLabelRotation = 45;
% h.TickLabelInterpreter = 'none';

% 
% [impGain,predAssociation] = predictorImportance(Mdl);
% 
% figure
% plot(1:numel(Mdl.PredictorNames),[impOOB' impGain'])
% title('Predictor Importance Estimation Comparison')
% xlabel('Predictor variable')
% ylabel('Importance')
% h = gca;
% h.XTickLabel = Mdl.PredictorNames;
% h.XTickLabelRotation = 45;
% h.TickLabelInterpreter = 'none';
% legend('OOB permuted','MSE improvement')
% grid on
% 
% figure
% imagesc(predAssociation)
% title('Predictor Association Estimates')
% colorbar
% h = gca;
% h.XTickLabel = Mdl.PredictorNames;
% h.XTickLabelRotation = 45;
% h.TickLabelInterpreter = 'none';
% h.YTickLabel = Mdl.PredictorNames;
% 
% predAssociation(1,2)
% 
toc