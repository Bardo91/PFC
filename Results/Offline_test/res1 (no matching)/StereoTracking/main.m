clear all;close all; clc;
station_out_log = load('outputFile_StereoTracking.txt');
real_log = load('ViconData2.txt');

[nO, mO] = size(real_log);
[nS, mS] = size(station_out_log);

ni = 1;
nf = 250;

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

% Filtrando tomando la media
posMed = [8, 12, 0; 5, 11, 0];
for i = 3:nf
   posMed = [posMed ; (station_out_log(i, 2:4) + posMed(i-1, :) + posMed(i-2, :))/3]; 
end

figure(4);
plot(       ni:nf, posMed(ni:nf,1),'r',...
            ni:nf, posMed(ni:nf,2),'g',...
            ni:nf, posMed(ni:nf,3),'b');
title('tracked trajectory using media');