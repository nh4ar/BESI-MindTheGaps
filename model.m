stateProb = zeros(1,length(M)); %init first state prob
stateProb(errData.from(1)) = 1;

nextState = zeros(1,length(M));
nextState(errData.to(1)) = 1;
stateProb = [stateProb; nextState];

currState = stateProb(end);
timeIndex = errData.timeIndex(1);

for i=2:height(errData)
    fromState = zeros(1,length(M));
    fromState(errData.from(i)) = 1;
    
    if isequal(currState, fromState)
    else % <<< ERROR DETECTED
        stateProb = [stateProb; fromState];
        timeIndex = [timeIndex; (errData.timeIndex(i-1)+errData.timeIndex(i))/2];
    end
    
    nextState = zeros(1,length(M)); %init next state
    nextState(errData.to(i)) = 1; %now in format [1 0 0 0 0]
    
%     predictState = currState*M;
%     nextStateNUM = find(nextState);
    
    stateProb = [stateProb; nextState];
    currState = nextState;
    
    timeIndex = [timeIndex; errData.timeIndex(i)];
end

% from-to
fromMatrix = stateProb;
toMatrix = stateProb(2:end,:);
toMatrix = [toMatrix; [0 0 0 0 1]];

[from, temp] = find(fromMatrix');
[to, temp] = find(toMatrix');

from = from(1:end-1);
to = to(1:end-1);
predictedStateTrans = table(from, to, timeIndex);

clear currState from fromMatrix fromState i nextState stateProb temp timeIndex to toMatrix

% %test
% plot(predictedStateTrans.timeIndex, predictedStateTrans.from, '--', 'LineWidth', 2)
