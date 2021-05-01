%Problem 1:
%Comparision of the forward bias I-Va  for Si and  Ge
clc
clear
%Defining Constants
T=300;
k=8.617e-5;
e0=8.85e-14;
q=1.602e-19;
Ks=[11.8 16];
ni=[1e10 2.5e13];
up=[437 1500];
EG=[1.12 0.66];
 
%Constants as per given values in the Problem Statement
A=1.0e-4;
ND=1.0e16;
Tn=1.0e-6;
Tp=1.0e-6;
 
%Calculation for I01
DP=k*T.*up;
LP=sqrt(DP.*Tp);
I01=q*A.*(DP./LP.*ni.^2./ND);
disp("Value of I01 is:");
disp(I01);
 
%Calculation for  I02
Vbi=EG/2 + k*T.*log(ND./ni);
W=sqrt(2.*Ks*e0/(q*ND).*Vbi);
I02=q*A.*ni/sqrt(Tn*Tp).*W.*(k*T)./(3.*Vbi./4);
disp("Value of I02 is:");
disp(I02);
 
%Calculation for ISi and IGe
VA=linspace(0.1,1);
ISi= I01(1).*exp(VA./(k*T))+I02(1).*exp(VA./(2*k*T));
IGe=I01(2).*exp(VA./(k*T))+I02(2).*exp(VA./(2*k*T));
close
 
%Plot
semilogy(VA,ISi,VA,IGe,'-');
grid;
axis([0 1 1.0e-12 1.0e-3]);
xlabel('VA(in volts)');
ylabel('I(A)');
text(.7,1.4e-9,'T=300K');
text(.7,4e-10,'ND=1e16/cm^3');
text(.25,1.4e-5,'Ge');
text(.48,1.4e-8,'Si');
title('Forward Biased I-Va plot for Si and  Ge at 300K');

