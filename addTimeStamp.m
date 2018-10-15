location = 5;
timeIndex = 1;
lineCount = 1;
i=2;
while (i<stateTrans.timeIndex(end))
    if(i>=stateTrans.timeIndex(lineCount))
        lineCount = lineCount+1;
    end
    location = [location; stateTrans.from(lineCount)];
    timeIndex = [timeIndex; i];
    i = i+1;
end
gndTruth = table(location, timeIndex);

location = 5;
timeIndex = 1;
lineCount = 1;
i=2;
while (i<errData.timeIndex(end))
    if(i>=errData.timeIndex(lineCount))
        lineCount = lineCount+1;
    end
    location = [location; errData.from(lineCount)];
    timeIndex = [timeIndex; i];
    i = i+1;
end
errLocation = table(location, timeIndex);

location = 5;
timeIndex = 1;
lineCount = 1;
i=2;
while (i<predictedStateTrans.timeIndex(end))
    if(i>=predictedStateTrans.timeIndex(lineCount))
        lineCount = lineCount+1;
    end
    location = [location; predictedStateTrans.from(lineCount)];
    timeIndex = [timeIndex; i];
    i = i+1;
end

predictedState = table(location, timeIndex);

figure;
area(gndTruth.timeIndex, gndTruth.location, 'FaceColor', [0.5 0.5 0.5], 'EdgeAlpha', 1)
hold on
% area(errLocation.timeIndex, errLocation.location, 'FaceColor', 'r', 'FaceAlpha', 0.25, 'EdgeAlpha', 0)
plot(errLocation.timeIndex, errLocation.location, ':', 'Color',[1 0 0], 'LineWidth', 2)
area(predictedState.timeIndex, predictedState.location, 'FaceColor', 'b', 'FaceAlpha', 0.4, 'EdgeAlpha', 0)
% alpha(0.8)

% plot(predictedState.timeIndex, predictedState.location, '-','Color',[0 1 0], 'LineWidth', 1)



