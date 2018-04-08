%% Mikhail Grushko - BE130 Pset 3

%% Setup

clc;
close all;
clear vars;

%% Problem 1b

Tf = 0.5;
t = 0:0.001:Tf;

x = 1920*t.^5 - 2400*t.^4 + 800*t.^3;
v = 9600*t.^4 - 9600*t.^3 + 2400*t.^2;
a = 38400*t.^3 - 28800*t.^2 + 4800*t.^1;

figure;
subplot(3,1,1); 
plot(t,x); title("Position"); xlabel("time")
subplot(3,1,2); 
plot(t,v); title("Velocity"); xlabel("time")
subplot(3,1,3); 
plot(t,a); title("Acceleration"); xlabel("time")

%% Problem 1d

%% Problem 2c

Tf = 0.5;
t = 0:0.001:Tf;

x = -160*t.^3 + 120*t.^2;
v = -480*t.^2 + 240*t.^1;
a = -480*t.^1 - 240*t.^0;

figure;
subplot(3,1,1); 
plot(t,x); title("Position"); xlabel("time")
subplot(3,1,2); 
plot(t,v); title("Velocity"); xlabel("time")
subplot(3,1,3); 
plot(t,a); title("Acceleration"); xlabel("time")

%% Problem 3c

Tf = 0.5;
t = 0:0.001:Tf;

x = -25600*t.^7 + 44800*t.^6 - 26880*t.^5 + 5600*t.^4;
v = -179200*t.^6 + 268800*t.^5 - 134400*t.^4 + 22400*t.^3;
a = -1075200*t.^5 + 1344000*t.^4 - 537600*t.^3 + 67200*t.^2;

figure;
subplot(3,1,1); 
plot(t,x); title("Position"); xlabel("time")
subplot(3,1,2); 
plot(t,v); title("Velocity"); xlabel("time")
subplot(3,1,3); 
plot(t,a); title("Acceleration"); xlabel("time")