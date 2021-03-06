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

Tf1 = 0.25;
t1 = 0:0.001:Tf1;
Tf2 = 0.5
t2 = Tf1:0.001:Tf2;

x = -1280*t1.^3 + 480*t1.^2;
v = -3840*t1.^2 + 960*t1.^1;
a = -7680*t1.^1 + 960*t1.^0;

x2 = (1280*t1.^3 - 480*t1.^2) + 10;
v2 = 3840*t1.^2 - 960*t1.^1;
a2 = 7680*t1.^1 - 960*t1.^0;

figure;
subplot(3,1,1); 
plot(t1,x); title("Position"); xlabel("time");
hold on;
plot(t2,x2); title("Position"); xlabel("time");
hold off; 

subplot(3,1,2); 
plot(t1,v); title("Velocity"); xlabel("time")
hold on;
plot(t2,v2); title("Velocity"); xlabel("time");
hold off; 

subplot(3,1,3); 
plot(t1,a); title("Acceleration"); xlabel("time")
hold on;
plot(t2,a2); title("Acceleration"); xlabel("time");
hold off; 

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

%% Problem 4a

% Minimal Square Jerk
N = 1000;
x0 = zeros(1, N);
csj = @(x,xf) diff([0,0,0,x,xf,xf,xf],3);
x = lsqnonlin(@(x) csj(x,10), x0);
x_= [0,x,10];
Tf=0.5; t=[0:(N+1)]/(N+1)*Tf; dt=Tf/(N+1);
figure; 
subplot(311); plot(t,x_); ylabel("Position"); title("Minimal Square Jerk"); hold on;
subplot(312); plot(t(2:end),diff(x_)/dt); ylabel("Velocity");hold on;
subplot(313); plot(t(2:end-1),diff(x_,2)/dt^2); ylabel("Acceleration");xlabel("Time(sec)");hold on;

% Minimal Square Acceleration
N = 1000;
x0 = zeros(1, N);
csa = @(x,xf) diff([0,0,0,x,xf,xf,xf],2);
x = lsqnonlin(@(x) csa(x,10), x0);
x_= [0,x,10];
Tf=0.5; t=[0:(N+1)]/(N+1)*Tf; dt=Tf/(N+1);
figure; 
subplot(311); plot(t,x_); ylabel("Position"); title("Minimal Square Acceleration"); hold on;
subplot(312); plot(t(2:end),diff(x_)/dt); ylabel("Velocity");hold on;
subplot(313); plot(t(2:end-1),diff(x_,2)/dt^2); ylabel("Acceleration");xlabel("Time(sec)");hold on;

% Minimal Square Acceleration
N = 1000;
x0 = zeros(1, N);
css = @(x,xf) diff([0,0,0,x,xf,xf,xf],4);
x = lsqnonlin(@(x) css(x,10), x0);
x_= [0,x,10];
Tf=0.5; t=[0:(N+1)]/(N+1)*Tf; dt=Tf/(N+1);
figure; 
subplot(311); plot(t,x_); ylabel("Position"); title("Minimal Square Acceleration"); hold on;
subplot(312); plot(t(2:end),diff(x_)/dt); ylabel("Velocity");hold on;
subplot(313); plot(t(2:end-1),diff(x_,2)/dt^2); ylabel("Acceleration");xlabel("Time(sec)");hold on;

%% Problem 4b

N = 50;
delta = 1e-8;
x = rand(1, N);
j = @(x,xf) diff([0,0,0,x,xf,xf,xf],3);
gr = 0*x;

for i = 1:1e6;
    prev_gr = gr;
    for k = 1:N
        a = 0*x;
        a(k) = delta;
        gr(k) = sum((j((x + a), 10).^2 - j(x, 10).^2))./delta;
    end
    dgr = gr - prev_gr;
    alpha = abs(dot(gr, gr)/dot(dgr, gr));
    x = x - 0.01*alpha.*gr;
    if rem(i,1000) == 1
        plot(x); title([i, alpha]); drawnow; 
    end
end

disp("Learning Finished")

%% Problem 5

N= 1000;
y = rand(1, N);
yi = 0;
yf = -1;
dx = 1/1000;

y = lsqnonlin(@(t) t_ramp(y, yi, yf, dx), yf);
y_= [yi,y,yf];

figure; 
subplot(311); plot(y_); ylabel("Position"); title("Minimal Square Jerk"); hold on;
subplot(312); plot(diff(y_)/dt); ylabel("Velocity");hold on;
subplot(313); plot(diff(y_,2)/dt^2); ylabel("Acceleration");xlabel("Time(sec)");hold on;

%%

t_ramp(y, yi, yf, dx);