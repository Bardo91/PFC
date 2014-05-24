clear all;close all; clc;
station_out_log = load('outputFile_StereoTracking.txt');
real_log = load('ViconData2.txt');

[nO, mO] = size(real_log);
[nS, mS] = size(station_out_log);

ni = 1;
nf = 50;

figure(ni);
plot(       ni:nf, real_log(ni:nf,2),'r',...
            ni:nf, real_log(ni:nf,3),'g',...
            ni:nf, real_log(ni:nf,4),'b');
title('Original trajectory');
        
figure(2);
plot(       ni:nf, station_out_log(ni:nf,2),'r',...
            ni:nf, station_out_log(ni:nf,3),'g',...
            ni:nf, station_out_log(ni:nf,4),'b');
title('tracked trajectory');

figure(3);
plot(   ni:nf, station_out_log(ni:nf,1), 'r');
title('Timespan');

%% 3D plots
figure(3);
plot3(      real_log(ni:nf,2), real_log(ni:nf,3), real_log(ni:nf,4), 'b',...
            station_out_log(ni:nf,2), station_out_log(ni:nf,3), station_out_log(ni:nf,4), 'r');
