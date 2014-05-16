clear all;close all; clc;
station_in_log = load('in_log.txt','r');
station_out_log = load('out_log.txt');
quad_out_log = load('out_Log_vrep.txt');

[nO, mO] = size(quad_out_log);
[nS, mS] = size(station_out_log);

figure(1);
plot(       2000:nO, quad_out_log(2000:nO,1),'b',...
            2000:nO, quad_out_log(2000:nO,2),'r');
title('Original trajectory');
        
figure(2);
plot(       1:mS, station_out_log(1:mS,1),'b',...
            1:mS, station_out_log(1:mS,2),'r');
title('tracked trajectory');

figure(3);
plot(station_in_log(:,3));
title('Timespan');
        