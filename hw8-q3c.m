%Problem 3C:
clc;
clear;
%Defining Constants
k=8.617e-5;
T=300;
e0=8.85e-14;
q=1.602e-19;
Ks=11.8;
ni=1.0e10;
%Given Parameters
Wb=2e-4; 
A=1e-4;
Ne=1.0e18; 
Nb=1.0e16;
Nc=1.0e15;
De=6.81; 
Db=11.3;
Dc=34.8;
Le=8.25e-4; 
Lb=3.36e-3; 
Lc=5.9e-3;
Veb=0.7; 
Vcb=-5;
ne0=ni^2/Ne; 
pb0=ni^2/Nb; 
nc0=ni^2/Nc;
Vbieb=(k*T)*log(Ne*Nb/ni^2);
Vbicb=(k*T)*log(Nc*Nb/ni^2);
