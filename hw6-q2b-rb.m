%Problem 2b: Reverse Biased Condition
clc
%Defining Constants
k= 8.617e-5;
T= 300;
kT= k * T;
KS= 11.8;
e0= 8.85e-14;
ND= 1e17;
NA= 1e15;
Lp= 3.47e-3;
Ln= 4.56e-3;
q= 1.602e-19;
VA= -0.3;           %Reverse Biased Condition
ni= 1e10;
%Plot
x= linspace(-0.01, -xp);
w= linspace(xn, 0.01);
Vbi= (kT/q) * (log(NA * ND) / (ni * ni));
xn= sqrt(((2 * KS * e0)/q) * (NA / (ND * (NA + ND))) * (Vbi - VA));
xp= sqrt(((2 * KS * e0)/q) * (ND / (NA * (NA + ND))) * (Vbi - VA));
NNA= ((ni * ni) / NA) * (exp(VA/0.025) - 1);
NND= ((ni * ni) / ND) * ((exp(VA/0.025)) - 1);
NNNA= 1e5 + NNA.*exp((x+xp)./ Ln);
NNND= 1e3 + NND.*exp(-(w-xn)./ Lp);
xp= sqrt(((2 * KS * e0)/q) * (ND / (NA * (NA + ND))) * (Vbi - VA))
xn= sqrt(((2 * KS * e0)/q) * (NA / (ND * (NA + ND))) * (Vbi - VA))
close
semilogy(x, NNNA, w, NNND, 'b');
grid;
hold on
xline(-xp, '--' );
xline(xn, '--');
title('np(x) and pn(x) in the Quasi-Neutral Regions');
xlabel('-xp & xn');
ylabel('n or p (log scale)');

