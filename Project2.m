% M-file: mag_current.m 
% M-file to calculate and plot the magnetization  
% current and the flux linkage of a 230/115 transformer operating at  
% 230 volts and 50 Hz. It is assumed that the volatage applied is a sine
% function with 0 degrees phase angle.
 
% Load the magnetization curve.  It is in two  
% columns, with the first column being mmf and 
% the second column being flux.  
load mag_curve_1.dat; 
mmf_data = mag_curve_1(:,1); 
flux_data = mag_curve_1(:,2); 
 
% Initialize values 
VM = 325;                   % Maximum voltage (V) 
NP = 850;                   % Primary turns 
NS = 425;

% Calculate angular velocity for 50 Hz 
freq = 50;                  % Freq (Hz) 
w = 2*pi*freq; 
 
% Calculate flux versus time 
time = 0:1/3000:1/30;       % 0 to 1/30 sec 
flux = -VM/(w*NP) * cos(w.*time); 
flux_linkage = (-VM/w)*cos(w.*time); 

% Calculate the mmf corresponding to a given flux 
% using the flux's interpolation function. 
mmf = interp1(flux_data,mmf_data,flux); 
 
% Calculate the magnetization current or the current drawn by the
% transformer
im = mmf / NP; 
 
% Plot the magnetization current. 
figure(1) 
subplot(2,1,1); 
plot(time,im); 
title ('\bfMagnetization current at 50 Hz'); 
xlabel ('\bfTime (s)'); 
ylabel ('\bf\itI_{m} \rm(A)'); 
axis([0 0.04 -2 2]); 
grid on; 

% Plot the flux linkage = NP*flux
figure(2) 
subplot(2,1,1); 
plot(time,flux_linkage); 
title ('\bfFlux Linkage at 50 Hz'); 
xlabel ('\bfTime (s)'); 
ylabel ('\bfFlux Linkage'); 
axis([0 0.04 -2 2]); 
grid on; 
