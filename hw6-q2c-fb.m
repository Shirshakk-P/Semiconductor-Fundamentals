%Problem 2c: Forward Biased Condition
clc
%Defining Constants
k= 8.617e-5;
k= 1.380e-23;
T= 300;
kT= k * T;
q= 1.6e-19;
KS= 11.8;
e0= 8.85e-1;
ni= 1e10;
ND= 1.0e17;
NA= 1.0e15;
NAD= NA + ND;
Lp= 3.47e-3;
Ln= 4.56e-3;
VA= 0.3;		%Forward Biased Condition
Dn= 34.93;
Dp= 11.64;
Vbi= (kT/q) * (log(NA * ND) / (ni * ni));
xn= sqrt(((2 * KS * e0)/q) * (NA / (ND * (NA + ND))) * Vbi);
xp= sqrt(((2 * KS * e0)/q) * (ND / (NA * (NA + ND))) * Vbi);
NNA= (1e2)*((q * Dn) / Ln) * ((ni * ni) / NA) * (exp(VA/0.025) - 1);
NND= (1e3)* ((q * Dp) / Lp) * ((ni * ni) / ND) * (exp(VA/0.025) - 1);
NNNA= NNA.*exp((x+xp)./Ln);
close
%Plot
fplot(@(x) NNA.*exp((x+xp)./Ln), [-0.01 -xp], 'b');
hold on
fplot(@(x) NND.*exp(-(x-xn)./Lp) , [-0.01 -xp], 'r');
hold on
fplot(@(x) NNA.*exp((x+xp)./Ln), [xn 0.01], 'b');
hold on
fplot(@(x) NND.*exp(-(x-xn)./Lp), [xn 0.01], 'r');
grid
xline(-xp , '--');
xline(xn, '--');
ylabel('-Charge Densities (J_n and J_p)');
xlabel('-x');
legend('J_n', 'J_p','Location','northwest');
title('Plot of JP(x) and JN(x) in the Device');

