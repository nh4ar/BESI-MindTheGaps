clear all
M = TransitionMatrix3();

bedRoom = 6;
initState = zeros(1,length(M));
initState(bedRoom) = 1; %state0
stateProb = initState;

preState = initState;

for i = 1:1143
    nextState = zeros(1,length(M)); %init nextState
    nextStateProb = preState*M;
    possibleStates = find(nextStateProb);
    go2State = possibleStates(randi(length(possibleStates)));
    nextState(go2State) = 1;

    stateProb = [stateProb; nextState];
    preState = nextState;
end

while(stateProb(end,bedRoom) ~= 1)
    nextState = zeros(1,length(M)); %init nextState
    nextStateProb = preState*M;
    if(nextStateProb(bedRoom))
        nextState(bedRoom) = 1;
        stateProb = [stateProb; nextState];
    else
        possibleStates = find(nextStateProb);
        go2State = possibleStates(randi(length(possibleStates)));
        nextState(go2State) = 1;

        stateProb = [stateProb; nextState];
        preState = nextState;
    end
end


clear initState initState preState go2State possibleStates nextState nextStateProb i

% from-to
fromMatrix = stateProb;
toMatrix = stateProb(2:end,:);
toMatrix = [toMatrix; [0 0 0 0 0 1]];

[from, temp] = find(fromMatrix');
[to, temp] = find(toMatrix');

from = from(1:end-1);
to = to(1:end-1);
stateTrans = table(from, to);

clear fromMatrix toMatrix from to temp

% %test
% location = [stateTrans.from; stateTrans.to(end)];
% figure;
% bar(location,1)
% hold
% plot(location, 'LineWidth', 2)

