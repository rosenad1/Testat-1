%% SiSy Exc3 Simple Pedometer
% Author: Adrian Rosenast, St17a, SiSy
% Information:
% To switch between the different sensor values change the number of the
% filename in line 8. 

clear all, close all, clc;                  % Fresh start
load('meas_B1.mat');   % Load sensor values

% Plot measured values
figure(1);
title('Exc 2: Distance Measurement', 'FontSize', 16);
subplot(3,1,1), plot(t, s_ch1), grid on;
title('Signal 1');
xlabel('[sec]'), ylabel('[v]');
subplot(3,1,2), plot(t, s_ch2), grid on;
title('Signal 2');
xlabel('[sec]'), ylabel('[v]')

% Variable initialisation
range = 0.015;
t_long = linspace(-0.015, 0.015, 2*length(t)-1);     % longer time vector to plot auto-correlation
v_sound = 343;                                        % [m/s]

% Cross correolation of the two signals and plot
corr_seq = xcorr(s_ch1, s_ch2);     
subplot(3,1,3), plot(t_long, corr_seq);, hold on
title('Cross Correolated Signal');
xlabel('[sec]');

% Find max value and mark the position on the plot
maxVal = max(corr_seq);                  % Find max value
posMaxVal = find(maxVal == corr_seq);     % Find position of max value
plot(t_long(posMaxVal), maxVal, 'rs', 'LineWidth', 1.5), grid on, 
hold off;

% Calculate the difference
timeDiff = abs(t(floor(posMaxVal/2)));

% Calculate distance between the signals
posDiff = timeDiff * v_sound;

% Display result in command window
disp('Distance between the two microphones: [m]');
disp(posDiff);


%% Why a sinus signal is not practical
t1 = linspace(-2*pi, 2*pi, 1000);
f1 = 2*sin(2*t1);
f2 = 2*sin(2*t1+ pi);

figure(2)
subplot(311), plot(t1, f1), hold on, grid on;
title('Sinus 1');
xlabel('[sec]'), ylabel('[v]');
subplot(312), plot(t1, f2), grid on;
title('Sinus 2');
xlabel('[sec]'), ylabel('[v]');

corr_seq2 = xcorr(f1, f2);  
t1_long = linspace(-2*pi, 2*pi, length(corr_seq2));
subplot(313), plot(t1_long, corr_seq2), grid on;
title('Cross Correolated');
xlabel('[sec]');
hold off;