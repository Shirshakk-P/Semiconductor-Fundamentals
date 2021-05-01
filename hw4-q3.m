%Problem 3:
clc
%Defining Constants
Ei=0.56;
kT=0.0259;
ni=10e10;
ND=10e15;
pn0=10e10;
delPnx(1,1)=10e10;
E=0:1.2;
t(1,1)=0;
for i=1:10
    delPnx(1,i)=pn0*exp(-t(1,i));
    t(1,i+1)=t(1,i)+1;
    Ep(1,i)=Ei-(kT*log(delPnx(1,i)/ni));
end
FN=Ei+(kT*log(ND/ni));
FP=Ei-(kT*log(delPnx/ni));
t=t(:,1:10);
 
%Plot
%plot for pn(x) as a function of x/Lp
subplot(2,1,1);
plot(delPnx',t');
ylabel('delPn(x)');
xlabel('x/Lp');
title('Plot for delPn(x)');
grid;
%plot for Fermi Levels FN and FP
subplot(2,1,2);
plot(i,E);
hold on
yline(Ei);
xline(FN);
plot(delPnx,FP);
hold off
ylabel('E');
xlabel('x');
title("Fermi Level Plot");
grid;
