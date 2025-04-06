%% Main Motor
L = 4.959e-04; R = 0.0158; k_w = inv(2*pi*243/60);
J = 0.01547;
k_a = 39.3e-3;
B = 15e-6;
k_s = 0.96;
AA = [-R/L -k_w/L 0; k_a/J -B/J 0; 0 1 0];
BB = [1/L; 0; 0];
CC = [1 0 0;0 1 0;0 0 1];
DD = zeros(3,1);
pole=[-16+49i -16-49i -9];
k=acker(AA,BB,pole);
%% 	Hub motor
L = 1.474e-03; R = 0.01457; k_w = inv(2*pi*243/60);
J = 9.558e-05;
k_a = 39.3e-3;
B = 15e-6;
k_s = 0.96;
AA = [-R/L -k_w/L 0; k_a/J -B/J 0; 0 1 0];
BB = [1/L; 0; 0];
CC = [1 0 0;0 1 0;0 0 1];
DD = zeros(3,1);
pole=[-5.47+381i -5.47-381i -14];
k=acker(AA,BB,pole)
