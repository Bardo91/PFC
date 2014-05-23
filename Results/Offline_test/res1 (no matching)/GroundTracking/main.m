clear all;close all; clc;
station_out_log = load('outputFile_GroundTracking.txt');
real_log = load('ViconData2.txt');

[nO, mO] = size(real_log);
[nS, mS] = size(station_out_log);

n = 250

figure(1);
plot(       1:n, real_log(1:n,2),'r',...
            1:n, real_log(1:n,3),'g',...
            1:n, real_log(1:n,4),'b');
title('Original trajectory');
        
figure(2);
plot(       1:n, station_out_log(1:n,2),'r',...
            1:n, station_out_log(1:n,3),'g',...
            1:n, station_out_log(1:n,4),'b');
title('tracked trajectory');

figure(3);
plot(   1:n, station_out_log(1:n,1), 'r');
title('Timespan');

% Filtrando tomando la media
posMed = [8, 12, 0; 5, 11, 0];
for i = 3:400
   posMed = [posMed ; (station_out_log(i, 2:4) + posMed(i-1, :) + posMed(i-2, :))/3]; 
end

figure(4);
plot(       1:n, posMed(1:n,1),'r',...
            1:n, posMed(1:n,2),'g',...
            1:n, posMed(1:n,3),'b');
title('tracked trajectory using media');


%% 3D plots
figure(3);
plot3(      real_log(1:n,2), real_log(1:n,3), real_log(1:n,4), 'b',...
            station_out_log(1:n,2), station_out_log(1:n,3), station_out_log(1:n,4), 'r');
