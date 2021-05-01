%Problem 2a: Forward Biased Condition
clc
%Defining Constants
k= 1.38e-23;
T= 300;
kT= k*T;
KS= 11.8;
e0= 8.85e-14;
ND= 1e17;
NA= 1e15;
Lp= 3.47e-3;
Ln= 4.56e-3;
q= 1.602e-19;
VA= 0.3;            %Forward Biased Condition
ni= 1e10;
Vbi= (kT/q)*(log((NA*ND)/(ni*ni)));
xn= sqrt(((2 * KS * e0)/q) * (NA / (ND * (NA + ND))) * (Vbi-VA));
xp= sqrt(((2 * KS * e0)/q) * (ND / (NA * (NA + ND))) * (Vbi-VA));
fprintf("In Forward Biased Condition:\n\n");
fprintf("Value of xp is=");
disp(xp);
fprintf("Value of xn is=");
disp(xn);
