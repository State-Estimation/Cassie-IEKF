%% Script to run simulation
clear all
% Reset 
clear; restoredefaultpath; clc;

% Add paths
addpath(genpath('forward_kinematics'))
addpath('example_code')

%% Open Model  
mdl = 'RIEKF_test';
open_system(mdl); % Simulation model

%% Sim Model
sim(mdl);

%% Plot Results
plot_results;

%%
indnoise=indn.signals.values;
time=ikfiter.time;
len=length(time);
for i=1:len
    iter(i)=ikfiter.signals.values(:,:,i);
    cx(i,:)=ikfcx.signals.values(:,:,i);
    cy(i,:)=ikfcy.signals.values(:,:,i);
end
%    
figure
hold on
plot(indnoise*100)
plot(iter)
legend('injected noise','iteration number')

%
figure
hold on
plot(indnoise+0.7)
plot(cx(:,10:15))
legend('injected noise','cx vector 10','cx vector 11','cx vector 12','cx vector 13','cx vector 14','cx vector 15','cx vector 16')

figure
hold on
plot(indnoise)
plot(cy(:,1:3))
legend('injected noise','cy vector 1','cx vector 2','cx vector 3')

