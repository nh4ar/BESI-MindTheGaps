%run generate_data to create ground truth
%use 'stateTrans' table to generate errors
clear all
generate_data

minute = 15;

errRate = 27/100;
removeIndex = 0;
timeIndex = randi(minute);
for i=2:height(stateTrans) %first state is always from bedRoom to Room#XX
    r = rand;
    if r <= errRate
        removeIndex = [removeIndex, i];
    end
    timeIndex = [timeIndex; timeIndex(i-1)+randi(minute)];
end
removeIndex = removeIndex(2:end);
% timeIndex = timeIndex(2:end);

stateTrans = [stateTrans table(timeIndex)];
errData = stateTrans;
errData(removeIndex,:) = [];

clear errRate bedRoom i r removeIndex timeIndex stateProb

% %test
% area(stateTrans.timeIndex,stateTrans.from,1)
% hold on
% plot(errData.timeIndex, errData.from, 'LineWidth', 3)
% % hold off