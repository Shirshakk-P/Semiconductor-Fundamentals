%Problem 4:
clc;
clear;
close;
%Defining Constants 
k=8.617e-5;
T=300;
kT=k*T;
WB=2.0e-4;
A=1e-4;
NE=1.0e18; 
NB=1.0e16; 
NC=1.0e15;
DE=6.81; 
DB=11.3; 
DC=34.8;
LE=8.25e-4; 
LB=3.36e-3; 
LC=5.9e-3; 
VCB=-5;
q=1.6e-19;
n2=1.5;
I02=1.0e-14;
VHi=0.75;
IF0=9.149e-15;
IR0=1.857e-14;
aF=0.9968;
aR=0.4910;
 
%IB and IC Calculations
VEB=linspace(0.3,0.7);
IBideal=IF0.*(1-aF).*(exp(VEB./kT)-1);
IRG=I02.*(exp(VEB/(n2*kT))-1);
IB=IBideal+IRG;
ICideal=aF.*IR0.*(exp(VEB./kT)-1);
IC=ICideal./(1+exp((VEB-VHi)./(2*kT)));
Beta=IC./IB;
 
%Plot
%Gummel Plot
subplot(2,1,1)
semilogy(VEB,IBideal,':w',VEB,ICideal,':w');
axis([.3,.7,1.0e-9,1.0e-1]);
hold on
semilogy(VEB,IB,'-m',VEB,IC,'-c');
grid;
xlabel('VEB (in Volts)');
ylabel('IB or IC (in Amps)');
title('Gummel Plot');
hold off;
 
%Gain Plot
subplot(2,1,2)
loglog(IC,Beta);
axis([1.0e-9,1.0e-1,1.0e-1,1.0e3]);
grid;
xlabel('IC (in Amps)');
ylabel('Î²dc');
title('Gain Plot');
