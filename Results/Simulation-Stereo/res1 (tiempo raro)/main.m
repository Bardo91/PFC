clear all;close all; clc;
station_in_log_quad1 = load('in_log_quad1.txt','r');
station_in_log_quad2 = load('in_log_quad2.txt','r');
station_out_log = load('out_log.txt');
quad_out_log = load('out_Log_vrep.txt');

[nO, mO] = size(quad_out_log);
[nS, mS] = size(station_out_log);

figure(1);
plot(       1:nO, quad_out_log(1:nO,1),'r',...
            1:nO, quad_out_log(1:nO,2),'g',...
            1:nO, quad_out_log(1:nO,3),'b');
title('Original trajectory');
        
figure(2);
plot(       1:nS, station_out_log(1:nS,1),'r',...
            1:nS, station_out_log(1:nS,2),'g',...
            1:nS, station_out_log(1:nS,3),'b');
title('tracked trajectory');

figure(3);
plot(   1:nS, station_in_log_quad1(:,3), 'r',...
        1:nS, station_in_log_quad2(:,3), 'g');
title('Timespan');

