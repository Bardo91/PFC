clear all;close all; clc;
station_in_log = load('in_log.txt','r');
station_out_log = load('out_log.txt');
quad_out_log = load('out_Log_vrep.txt');

[nO, mO] = size(quad_out_log);
[nS, mS] = size(station_out_log);

figure(1);
plot(       20000:nO, quad_out_log(20000:nO,1),'b',...
            20000:nO, quad_out_log(20000:nO,2),'r');
title('Original trajectory');
        
figure(2);
plot(       260:nS, station_out_log(260:nS,1),'b',...
            260:nS, station_out_log(260:nS,2),'r');
title('tracked trajectory');

figure(3);
plot(station_in_log(:,3));
title('Timespan');

realMaxX = max(quad_out_log(20000:nO,1));
realMinX = min(quad_out_log(20000:nO,1));
trackMaxX = max(station_out_log(1:mS,1));
trackMinX = min(station_out_log(1:mS,1));


realMaxY = max(quad_out_log(20000:nO,2));
realMinY = min(quad_out_log(20000:nO,2));
trackMaxY = max(station_out_log(1:mS,2));
trackMinY = min(station_out_log(1:mS,2));

