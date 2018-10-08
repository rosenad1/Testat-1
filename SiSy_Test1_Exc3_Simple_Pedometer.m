%% SiSy Exc3 Simple Pedometer
% Author: Adrian Rosenast, St17a, SiSy
% With the angle (Azimuth) of the smartphone it is possible to count the 
% steps. In this way the program works also for low speeds.
% The steps are marked with a red square in the figure and the threshold 
% with two black lines, so it is easier to understand how the program works.


clear all, close all, clc;                  % Fresh start
load('SiSy_Test1_Exc3_SensorValuesAR.mat');   % Load sensor values

% Initialisation of variables
array = o(:,1);
i = 1;
nbrOfSteps = 0;
lastLegPos = 0;   % Start foot position is 90% to the floor = 0
                  % Front would be = 1
                  
                  
%% Calculation of the number of steps                    
 while (i ~= length(array))
     if(lastLegPos == 0)                                % If last foot position was 90° to the floor
         if(array(i) > 0)                               % Check if foot is in front 
             nbrOfSteps = nbrOfSteps + 1;
             lastLegPos = 1;
             plot(to(i), array(i), 'rs', 'LineWidth', 1.5), hold on;      % Plot threshold point
         end
     else if(array(i) < -30)                            % If last foot position was in front
             nbrOfSteps = nbrOfSteps + 1;
             lastLegPos = 0;
             plot(to(i), array(i), 'rs', 'LineWidth', 1.5), hold on;      % Plot threshold point
         end
     end
     i = i+1;                                           % Go to the next value in the array
 end


%% Plot
%Plot the graph of the angle
plot(to, o(:,1), 'b', 'LineWidth', 1.5), title('Exc 3: Simple Pedometer', 'FontSize', 16); grid on; hold on;

% Plot threshold lines
y1 = zeros(1,length(array));
y2 = ones(1,length(array));
plot(to, y1, 'k'), plot(to, -30.*y2, 'k');

% Add legends, labels...
legend('New Step', 'location', 'northeast');
xlabel('Time (sec)'), ylabel('Azimuth [deg]'), ylim([-140, 100]), xlim([-0.2, 9.8]);

%% Calculation 
% Calculation average time between two steps (Average frequency)
t_total = 9.8;   % in Sek
AvStepFreq = t_total / nbrOfSteps;


% Show the calculated values in the command window
disp('Number of Steps:'), disp(nbrOfSteps);         % Nbr of Steps
disp('');                                           
disp('Average step frequency: (sec/step)'), disp(AvStepFreq);  % Average Step Frequency