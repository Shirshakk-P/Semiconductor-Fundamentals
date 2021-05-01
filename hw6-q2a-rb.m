%Problem 2a: Reversed Biased Condition
clc
%Defining Constants
k= 8.617e-5;
T= 300;
kT= k * T;
kS= 11.8;
e0= 8.85e-14;
ND= 1e17;
NA= 1e15;
Lp= 3.47e-3;
Ln= 4.56e-3;
q= 1.602e-19;
VA= -0.3;           %Reverse Biased Condition
ni= 1e10;
Vbi= (kT/q) * (log(NA * ND) / (ni * ni));
xp= sqrt(((2 * kS * e0)/q) * (ND / (NA * (NA + ND))) * (Vbi - VA));
xn= sqrt(((2 * kS * e0)/q) * (NA / (ND * (NA + ND))) * (Vbi - VA));
fprintf("In Reverse Biased Condition:\n\n");
fprintf("Value of xp is=");
disp(xp);
fprintf("Value of xn is=");
disp(xn);
