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

% Triangulate from input of station
fl = 20;
triPos = [];
for i = 1:nS
   R = rotx(station_in_log(i,7))*roty(station_in_log(i,8))*rotz(station_in_log(i,9)) ;
   C = station_in_log(i,4:6)';
   Zk = station_in_log(i,10:11)';
   
   x_c = 0.05-C(3)/(R(3,1) + R(3,2)*Zk(1)/fl + R(3,3)*Zk(2)/fl);
   y_c = Zk(1)*x_c/fl;
   z_c = Zk(2)*x_c/fl;
   
   X = C(1) + R(1,1)*x_c + R(1,2)*y_c + R(1,3)*z_c;
   Y = C(2) + R(2,1)*x_c + R(2,2)*y_c + R(2,3)*z_c;
   
   triPos = [triPos ; X , Y];
end

figure(4);
plot(       260:nS, triPos(260:nS,1),'b',...
            260:nS, triPos(260:nS,2),'r');