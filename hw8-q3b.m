%Problem 3B:
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
%Effective Base Width(W) 
x_eb=(2*Ks*e0/q)*(Ne/(Nb*(Ne+Nb)))*(Vbieb-Veb);
xeb=sqrt(x_eb);
 
x_cb=(2*Ks*e0/q)*(Nc/(Nb*(Nc+Nb)))*(Vbicb-Vcb);
xcb=sqrt(x_cb);
W=Wb-xeb-xcb;
%Minority Carrier Concentration in Quasi-Neutral Regions
x=linspace(0,0.02,1000);
ne=ne0*(exp(Veb/(k*T))-1)*exp(-x/Le);
nc=nc0*(exp(Vcb/(k*T))-1)*exp(-x/Lc);
dpb0=pb0*(exp(Veb/(k*T))-1);
dpbw=pb0*(exp(Vcb/(k*T))-1);
pb=dpb0+(dpbw-dpb0)*(x/W);
%Plot
figure(1);
subplot(1,3,1);
plot(-x,ne,'r-');grid;
xlabel('Emitter QuasiNeutral zone(cm)');
ylabel('nE(x) (per cm^3)');
subplot(1,3,3)
plot(x,-nc,'b-');grid;
xlabel('Collector QuasiNeutral zone(cm)');
ylabel('nC(x) (per cm^3)');
subplot(1,3,2);
plot(x,pb,'g-');grid;
xlabel('Base QuasiNeutral zone(cm)');
ylabel('pB(x) (per cm^3)');
