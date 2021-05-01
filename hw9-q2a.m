%Problem 2A:
clc;
clear;

%Defining Constants
k = 8.617e-5;
T = 300;
kT = k*T;
q = 1.6e-19;
Ks = 11.8;
NA = 1.0e16;
e0 = 8.85e-14;
Eg = 1.12;
ni = 1.0e10;
phiM = 4.65;
phiS = 4.03;
Ecvfb = Eg/2 - (kT*log(NA/ni));
Ecvfb = Eg/2 - (kT*log(NA/ni))
X = phiS - Ecvfb;
X = phiS - Ecvfb
phiB = Eg + X - phiM;
phiB = Eg + X - phiM
Vbi = phiB - Ecvfb;
Vbi = phiB - Ecvfb
W = sqrt(((2*Ks*e0)/(q*NA))*Vbi);
W = sqrt(((2*Ks*e0)/(q*NA))*Vbi)
rho = q*NA;
E = -((q*NA)/(Ks*e0));
V = -((q*NA)/(2*Ks*e0));
 
%Plots
close
%Plot for Charge Density:
subplot(2,2,1)
fplot(@(x) rho,[0 W], 'b')
axis([0 W 0 rho])
ylabel('Charge density'), xlabel('distance (m)')
%Plot for  Electric Field:
subplot(2,2,2)
fplot(@(x) E.*(W-x), [0 W], 'b')
ylabel('Electric Field'), xlabel('distance (m)')
%Plot for Electric Potential:
subplot(2,2,3)
fplot(@(x) V.*(W-x)^2, [0 W], 'b')
ylabel('Potential'),xlabel('distance (m)')
%Plot for Energy Band Diagram:
subplot(2,2,4)
fplot(@(x) -V*(W-x)^2, [0 W], 'b')
hold on
fplot(@(x) -V*(W-x)^2-Ecvfb, [0 W], 'r--')
hold on
fplot(@(x) -V*(W-x)^2-(2*Ecvfb), [0 W], 'g')
hold on
fplot(@(x) -0.2028, [0 W], 'k')
title('Energy band Diagram')
legend('E_C', 'E_i', 'E_V', 'E_F')
