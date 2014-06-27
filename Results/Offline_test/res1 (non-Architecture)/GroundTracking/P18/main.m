clear all;close all; clc;
station_out_log = load('outputFile_GroundTracking.txt');
real_log = load('ViconData2.txt');

[nO, mO] = size(real_log);
[nS, mS] = size(station_out_log);

nS = 100;
nO = 100;
figure(1);
plot(       1:nO, real_log(1:nO,2),'r',...
            1:nO, real_log(1:nO,3),'g',...
            1:nO, real_log(1:nO,4),'b');
title('Original trajectory');
        
figure(2);
plot(       1:nS, station_out_log(1:nS,2),'r',...
            1:nS, station_out_log(1:nS,3),'g',...
            1:nS, station_out_log(1:nS,4),'b');
title('tracked trajectory');

figure(4);
plot3(      real_log(1:nO,2), real_log(1:nO,3), real_log(1:nO,4), 'b',...
            station_out_log(1:nS,2), station_out_log(1:nS,3), station_out_log(1:nS,4), 'r');
