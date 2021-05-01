%Problem 3:
clc;
clear;
 
% p-type Deep Depletion MOS-C C-V characteristics
%Initialization and Input
format compact
NA1=10e16;
NA2=10e15;
NA3=10e14;
xo=0.1*10e-6;
 
%Defining Constants and Parameters
e0=8.854e-14;
q=1.6e-19;
k=8.617e-5;
KS=11.8;
KO=3.9;
ni=1.0e10;
T=300;
kT=k*T;
 
%Computing Constants
UF1=log(NA1/ni);
UF2=log(NA2/ni);
UF3=log(NA3/ni);
LD=sqrt((kT*KS*e0)/(2*q*ni));
 
%Computation for the condition  US<UF (or VG<VI)
US1=UF1-21:0.5:UF1;
US2=UF2-21:0.5:UF2;
US3=UF3-21:0.5:UF3;
F1=sqrt(exp(UF1).*(exp(-US1)+US1-1)+exp(-UF1).*(exp(US1)-US1-1));
F2=sqrt(exp(UF2).*(exp(-US2)+US2-1)+exp(-UF2).*(exp(US2)-US2-1));
F3=sqrt(exp(UF3).*(exp(-US3)+US3-1)+exp(-UF3).*(exp(US3)-US3-1));
VG1=kT*(US1+(US1./abs(US1)).*(KS*xo)/(KO*LD).*F1);
VG2=kT*(US2+(US2./abs(US2)).*(KS*xo)/(KO*LD).*F2);
VG3=kT*(US3+(US3./abs(US3)).*(KS*xo)/(KO*LD).*F3);
DENOM1=exp(UF1).*(1-exp(-US1))+exp(-UF1).*(exp(US1)-1);
DENOM2=exp(UF2).*(1-exp(-US2))+exp(-UF2).*(exp(US2)-1);
DENOM3=exp(UF3).*(1-exp(-US3))+exp(-UF3).*(exp(US3)-1);
W1=(US1./abs(US1)).*LD.*(2*F1)./DENOM1;
W2=(US2./abs(US2)).*LD.*(2*F2)./DENOM2;
W3=(US3./abs(US3)).*LD.*(2*F3)./DENOM3;
c1=1.0./(1+(KO*W1)./(KS*xo));
c2=1.0./(1+(KO*W2)./(KS*xo));
c3=1.0./(1+(KO*W3)./(KS*xo));
 
%Computation for the ccondition US>UF (or VI<VG<5VT)
FI1=sqrt(exp(UF1).*(exp(-UF1)+UF1-1)+exp(-UF1).*(exp(UF1)-UF1-1));
FI2=sqrt(exp(UF2).*(exp(-UF2)+UF2-1)+exp(-UF2).*(exp(UF2)-UF2-1));
FI3=sqrt(exp(UF3).*(exp(-UF3)+UF3-1)+exp(-UF3).*(exp(UF3)-UF3-1));
phiF1=kT*UF1;
phiF2=kT*UF2;
phiF3=kT*UF3;
VI1=kT*(UF1+(KS*xo)/(KO*LD).*FI1);
VI2=kT*(UF2+(KS*xo)/(KO*LD).*FI2);
VI3=kT*(UF3+(KS*xo)/(KO*LD).*FI3);
VT1=2*phiF1+(KS*xo/KO)*sqrt((4*q*NA1*phiF1)/(KS*e0));
VT2=2*phiF2+(KS*xo/KO)*sqrt((4*q*NA2*phiF2)/(KS*e0));
VT3=2*phiF3+(KS*xo/KO)*sqrt((4*q*NA3*phiF3)/(KS*e0));
Vdelta1=(q/2)*(KS*xo^2*NA1)/(KO^2*e0);
Vdelta2=(q/2)*(KS*xo^2*NA2)/(KO^2*e0);
Vdelta3=(q/2)*(KS*xo^2*NA3)/(KO^2*e0);
VGA=VI1+0.1:0.1:5*VT1;
VGB=VI2+0.1:0.1:5*VT2;
VGC=VI3+0.1:0.1:5*VT3;
cA=1./sqrt(1+VGA./Vdelta1);
cB=1./sqrt(1+VGB./Vdelta2);
cC=1./sqrt(1+VGC./Vdelta3);
 
%Combining the above parameters
calpha=[c1,cA];
cbeta=[c2,cB];
cgamma=[c3,cC];
VGalpha=[VG1,VGA];
VGbeta=[VG2,VGB];
VGgamma=[VG3,VGC];
 
%Plot
plot(VGalpha,calpha); grid;
axis([-3*VT1,5*VT1,0,1.1])
hold on
plot(VGbeta,cbeta);
axis([-3*VT2,5*VT2,0,1.1])
hold on
plot(VGgamma,cgamma);
axis([-3*VT3,5*VT3,0,1.1])
xlabel('VG (volts)'); ylabel('C/CO');
title("Charcteristic Plot");
