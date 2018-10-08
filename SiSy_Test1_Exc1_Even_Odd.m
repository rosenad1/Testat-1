%% SiSy Test-1: Even/Odd exercise
% Author: Adrian Rosenast, St17a, SiSy
% ==========================================
clear all, close all, clc;

% Define Signal
tstep = 1e-2;
t = -3:tstep:3;
x_t = 2*t + cos(2*pi*t/2.5);            % original function
x_tm = 2*(-t) + cos(2*pi*(-t)/2.5);     % mirrored function

% Decomposition in Even/Odd parts
xe_t = (x_t + x_tm)/2;
xo_t = (x_t - x_tm)/2;

% Visualise
figure(1)
title('Function x(t)');
subplot(311), plot(t,x_t), grid on, ylabel('orig fct')
subplot(312), plot(t,xe_t), grid on, ylabel('even part'),ylim([-3 3])
subplot(313), plot(t,xo_t), grid on, ylabel('odd part')

%% Example
% Generate random function
%t = linspace(0, 2*pi, 100);
A = randn(1);
f = randn(1);
x2_t = A*t + cos(2*pi*f*t);
x2_tm = A*(-t) + cos(2*pi*f*(-t));

% Decomposition in Even/Odd parts
xe2_t = (x2_t + x2_tm)/2;
xo2_t = (x2_t - x2_tm)/2;

figure(2) 
title('Function with random parameters');
subplot(311), plot(t, x2_t); grid on, ylabel('orig fct');
subplot(312), plot(t,xe2_t), grid on, ylabel('even part'),ylim([-3 3]);
subplot(313), plot(t,xo2_t), grid on, ylabel('odd part');
