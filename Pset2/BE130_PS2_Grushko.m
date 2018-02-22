%% Mikhail Grushko - BE130 Pset 2 - Problem 4

%% Setup

clc;
close all;
clear vars;
k1 = 0.022;
k0 = 0.025;
theta = pi/4;

%% Random vs evenly spaced 

% 100 randomly spaced
size = 100;
r100 = zeros(1, size);
thetapref = 2*pi*rand(1, size);


for i = 1 : length(r100)
    r100(i) = k1 * cos(thetapref(i) - theta) + k0;
end

PV = zeros(2, 100);

for i = 1 : size
    PV(1, i) = r100(i)*cos(thetapref(i));
    PV(2, i) = r100(i)*sin(thetapref(i));
end

figure;
plotv(PV);

% 100 evenly spaced

size = 100;
r100 = zeros(1, size);
thetapref = 2*pi*linspace(0, 1, size);


for i = 1 : length(r100)
    r100(i) = k1 * cos(thetapref(i) - theta) + k0;
end

PV = zeros(2, 100);

for i = 1 : size
    PV(1, i) = r100(i)*cos(thetapref(i));
    PV(2, i) = r100(i)*sin(thetapref(i));
end

figure;
plotv(PV);

