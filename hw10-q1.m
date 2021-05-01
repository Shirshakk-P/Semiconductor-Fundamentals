%Problem 1:
clc; 
clear;
 
%Defining Constants
k = 8.617e-5;
T = 300;
kT = k * T;
Ks = 11.68;
Ko = 3.7;
q = 1.0e-19;
NA = 10e19;
e0 = 8.854e-12;
phis1 = 6 * (kT/q);
phis2 = 12 * (kT/q);
phis3 = 24 * (kT/q);
phis4 = 30 * (kT/q);
W1 = sqrt(((2 * Ks * e0)/(NA)) * phis1);
W2 = sqrt(((2 * Ks * e0)/(NA)) * phis2);
W3 = sqrt(((2 * Ks * e0)/(NA)) * phis3);
W4 = sqrt(((2 * Ks * e0)/(NA)) * phis4);
phi = ((q * NA)/(2*Ks*e0));
 
%Plots
close;
hold on
subplot(1,4,1)
fplot(@(x) (-phi/kT)*((W1-x).^2), [0 W1], 'b')
title("Accumulation");grid;
subplot(1,4,2)
fplot(@(x) (phi/kT)*((W2-x).^2), [0 W2], 'r')
title("Middle of Depletion");grid;
subplot(1,4,3)
fplot(@(x) (phi/kT).*((W3-x).^2), [0 W3], 'g')
title("Onset of Depletion");grid;
subplot(1,4,4)
fplot(@(x) (phi/kT).*((W4-x).^2), [0 W4], 'k')
title("Deep into Inversion");grid;
hold off
