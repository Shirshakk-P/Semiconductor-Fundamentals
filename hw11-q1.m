%Problem 1:
clc
clear;
 
%Defining Constants and Parameters
q=1.60e-19;
e0=8.85e-14;
kT=0.0259;
ni=1.0e10;
KS=11.8;
KO=3.9;
NA=1.0e20;
xo=0.1e-6;
 
%Computed Parameters
phiF=kT*log(NA/ni);
WT=sqrt((4*KS*e0*phiF)/(q*NA));
Co=KO*e0/xo;
VW=q*NA*WT/Co;
 
%ID-VD COMPUTATION
for VGT=4:-1:1                  %VGT=VG-VT
    %Computation
    VDsq=linspace(0,VGT);
    IDsq=VGT.*VDsq-VDsq.*VDsq./2;
    IDSATsq=VGT*VGT/2;
    VDsq=[VDsq,9];
    IDsq=[IDsq,IDSATsq];
    A=VGT/(2*phiF);
    B=1+VW/(4*phiF);
    VDsat=VGT-VW*(sqrt(A+B^2)-B);
    VD=linspace(0,VDsat);
    ID1=VGT.*VD-VD.*VD/2;
    VDF=VD./(2*phiF);
    ID2=(4/3)*VW*phiF.*((1+VDF).^1.5-(1+1.5*VDF));
    ID=ID1-ID2;
    IDsat1=VGT.*VDsat-VDsat.*VDsat/2;
    VDFsat=VDsat./(2*phiF);
    IDsat2=(4/3)*VW*phiF.*((1+VDFsat).^1.5-(1+1.5*VDFsat));
    IDsat=IDsat1-IDsat2;
    VD=[VD,9];
    ID=[ID,IDsat];
   
    %Plots
    if VGT==4
        plot(VD,ID,'b','Linewidth',2.0);
        plot(VDsq,IDsq,'r','Linewidth',2.0);
        legend('SQUARE LAW THEORY','BULK CHARGE THEORY');
        grid;
        axis([0 10 0 10]);
        xlabel('VD (volts)');
        ylabel('ID/(ZuCo/L)');
        text(8,IDsat+0.2,'VG-VT=4V');
        text(8,IDSATsq+0.2,'VG-VT=4V');
        hold on
    else
        plot(VD,ID,'b','Linewidth',2.0);
        plot(VDsq,IDsq,'r','Linewidth',2.0);
           legend('SQUARE LAW THEORY','BULK CHARGE THEORY');
        %if VG-VT <4
        if VGT==3
            text(9,IDsat+0.2,'VG-VT=3V');
            text(8,IDSATsq+0.2,'VG-VT=3V');
        elseif VGT==2
            text(9,IDsat+0.2,'VG-VT=2V');
            text(8,IDSATsq+0.2,'VG-VT=2V');
        else
            text(9,IDsat+0.1,'VG-VT=1V');
            text(8,IDSATsq+0.25,'VG-VT=1V');
        end
    end
end
title("Comparision of Current(ID)-Voltage(VD) Charactersitics");
hold off
