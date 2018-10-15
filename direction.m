function direc = direction(doorSensor, numSample)

y = get(gca, 'ylim');

if doorSensor.s1(numSample)-doorSensor.s1(numSample-1) == 1
    if doorSensor.s2(numSample) == 0
        for j = 1:20
            if doorSensor.s2(numSample+j) ==1
                text(doorSensor.timeIndex(numSample), y(2), 'in');
                direc = 'in';
                break;
            end
        end

    else %if s2(i) == 1
        if doorSensor.s2(numSample-1) == 1
            text(doorSensor.timeIndex(numSample), y(2), 'out');
            direc = 'out';
        end
    end
    
else
    direc = '';
end


end
    