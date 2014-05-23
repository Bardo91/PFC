clear all;close all; clc;
station_in_log = load('in_log.txt','r');
station_out_log = load('out_log.txt');
quad_out_log = load('out_Log_vrep.txt');

[nO, mO] = size(quad_out_log);
[nS, mS] = size(station_out_log);

figure(1);
plot(       1:nO, quad_out_log(1:nO,1),'b',...
            1:nO, quad_out_log(1:nO,2),'r');
title('Original trajectory');
        
figure(2);
plot(       1:nS, station_out_log(1:nS,1),'b',...
            1:nS, station_out_log(1:nS,2),'r');
title('tracked trajectory');

figure(3);
plot(station_in_log(:,3));
title('Timespan');


%% 3D plots
Z1(1:nO) = 0;
Z2(1:nS) = 0;

figure(3);
plot3(      quad_out_log(1:nO,1), quad_out_log(1:nO,2), Z1, 'b',...
            station_out_log(1:nS,1), station_out_log(1:nS,2), Z2, 'r');
