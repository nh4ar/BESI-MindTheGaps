function out = data_pre(doorSensor_in)

%% Convert to 0<->1
index = find(doorSensor_in.s1>25); doorSensor_in.s1(index) = 1;
index = find(doorSensor_in.s1~=1); doorSensor_in.s1(index) = 0;
index = find(doorSensor_in.s2>25); doorSensor_in.s2(index) = 1;
index = find(doorSensor_in.s2~=1); doorSensor_in.s2(index) = 0;


%% Stiches multiple trigger in to one
data = doorSensor_in;

se = strel('square', 10);

out = data;
out.s1 = imclose(data.s1,se);
out.s2 = imclose(data.s2,se);

end