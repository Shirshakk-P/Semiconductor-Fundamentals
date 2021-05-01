%Problem 2:
clc;
clear;
 
%Defining Constants
kS=11.8;
kO=3.9;
xo=1.0e-5;
NA=1e15;
kT=0.0259;
e0=8.85e-14;
q=1.6e-19;
ni=1.0e10;
LD=sqrt((kS*e0*kT)/(2*q*ni));
N=abs(NA);
sign=-NA/N;
UF=sign*log(N/ni);
US=UF-21:1:UF+21;
S=US./abs(US);
F=sqrt(exp(UF).* (exp(-US)+US-1)+exp(-UF) .*(exp(US)-US-1));
VG=kT*(US+S*(kS*xo)/(kO*LD).*F);
Us=0:1:-2*UF;
P = (kS/kO)* xo;
Q = (2*q*NA)/(kS*e0 );
pF=log(N/ni);
ps = 0:1:2*pF;
VG_d  = (ps .*kT) + (P .*sqrt( Q .* ps .*(kT)));
 
%Plots
close;
hold on
plot(-US,-VG);
plot(Us,VG_d);
grid
axis([-40,40,-4,4]);
xlabel('phi(S)/(kT/q)');
ylabel("VG(volts)");
ax=gca;
ax.XAxisLocation="origin";
ax.YAxisLocation="origin";
legend({'Exact Solution','Delta-depletion'},'Location','northwest')
title("Interrelationship between Applied Gate Voltage and Surface Potential");
hold off
