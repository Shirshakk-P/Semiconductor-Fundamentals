%Problem 3A:
clc;
clear;
%Defining Constants
k=8.617e-5;
T=300;
e0=8.85e-14;
q=1.602e-19;
Ks=11.8;
ni=1.0e10;
 
%Given Parameters and Values
Wb=2e-4; 
A=1e-4;
Ne=1.0e18; 
Nb=1.0e16; 
Nc=1.0e15;
Veb=0.7; 
Vcb=-5;
 
%Depletion Region Lengths (Equilibrium)
Vbieb=(k*T)*log(Ne*Nb/ni^2);
W_eb=(2*Ks*e0/q)*((Ne+Nb)/(Ne*Nb))*Vbieb;
Web=sqrt(W_eb);
fprintf("EB depletion length is %e cm\n",Web);
 
Vbicb=(k*T)*log(Nc*Nb/ni^2);
W_cb=(2*Ks*e0/q)*((Nc+Nb)/(Nc*Nb))*Vbicb;
Wcb=sqrt(W_cb);
fprintf("CB depletion length is %e cm\n",Wcb);
 
%Depletion Region Lengths (Under Bias)
W_eb=(2*Ks*e0/q)*((Ne+Nb)/(Ne*Nb))*(Vbieb-Veb);
Web=sqrt(W_eb);
fprintf("EB depletion length under bias is %e cm\n",Web);
 
W_cb=(2*Ks*e0/q)*((Nc+Nb)/(Nc*Nb))*(Vbicb-Vcb);
Wcb=sqrt(W_cb);
fprintf("CB depletion length under bias is %e cm\n",Wcb);
