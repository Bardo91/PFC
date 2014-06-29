clear all;close all; clc;
station_in_log = load('in_log.txt','r');
station_out_log = load('out_log.txt');
quad_out_log = load('out_Log_vrep.txt');

[nO, mO] = size(quad_out_log);
[nS, mS] = size(station_out_log);

figure(1);
subplot(2,1,1);
plot(       1:nO, quad_out_log(1:nO,1),'b',...
            1:nO, quad_out_log(1:nO,2),'r');
title('Original trajectory');
subplot(2,1,2);
plot(       1:nS, station_out_log(1:nS,1),'b',...
            1:nS, station_out_log(1:nS,2),'r');
title('tracked trajectory');

figure(2);
subplot(2,1,1);
plot(   1:nS, station_in_log(:,10), 'b',...
        1:nS, station_in_log(:,11), 'r');
subplot(2,1,2)
zk(1:nS) = 0;
plot3(station_in_log(:,10), station_in_log(:,11), zk);
figure(3);
plot(station_in_log(:,3));
title('Timespan');
medTime = sum(station_in_log(:,3))/nS;
fps = 1/medTime;

%% "Brute triangulation"

PERSPECTIVE_ANGLE = 45/180*pi;
CAM_WIDTH_PIX = 256;
CAM_HEIGHT_PIX = 256;
FOCAL_LENGHT =  1 / (2 * tan(PERSPECTIVE_ANGLE / 2) / CAM_WIDTH_PIX);

u0 = CAM_WIDTH_PIX/2;
v0 = CAM_HEIGHT_PIX/2; 
f = FOCAL_LENGHT; % Aprox

X_brute2 = [];
z = 0.05;
for i = 1:nS
    C = station_in_log(i, 4:6)';
    % Rot mat Global to local
    R =     rotx(station_in_log(i,7)*180/pi)*...
            roty(station_in_log(i,8)*180/pi)*...
            rotz(station_in_log(i,9)*180/pi);

    Zk = [station_in_log(i,10) - u0, station_in_log(i,11) - v0];
    
    zc = (z - C(3))/(- Zk(1)/f*R(1,3) + Zk(2)/f*R(2,3) + R(3,3));
    
    Xc = [-Zk(1)/f ; Zk(2)/f ; 1] * zc;
    
    X = C + R'*Xc;
    
    X_brute2 = [X_brute2 ; X'];
end




%% 3D plots
Z1(1:nO) = 0;
Z2(1:nS) = 0;

testN  = nS;
figure(4);
plot3(      quad_out_log(1:nO,1), quad_out_log(1:nO,2), Z1, 'b',...
            station_out_log(1:testN,10), station_out_log(1:testN,11), Z2(1:testN), 'r',...
            X_brute2(1:nS, 1), X_brute2(1:nS, 2), X_brute2(1:nS, 3), 'g');        
        
