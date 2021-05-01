%Question 2: Plotting the Si pn-junction electrostatics and finding Built-in Potential and Peak Electric field 
clc
 
%Defining Constants
T=300;
k=8.617e-5;
eO=8.85e-14;
q=1.602e-19;
KS=11.8;
ni=10e10;
EG=1.12;
xleft =-3.5e-4; 
xright=-xleft; 
NA=input('Please enter p_side doping (cm0-3).NA=');
ND=input('Please enter n-side doptng (ctno_3),ND=');
 
%Computation
Vbi=k*T*log((NA*ND)/ni^2);
xN=sqrt(2*KS*eO/q*NA*Vbi/(ND*(NA+ND)));
xP=sqrt(2*KS*eO/q*ND*Vbi/(NA*(NA+ND)));
x=linspace(xleft,xright,200);
Vx1=(Vbi-q*ND.*(xN-x).^2/(2*KS*eO).*(x<=xN)).*(x>=0);
Vx2=0.5*q*NA.*(xP+x).^2/(KS*eO).*(x>=-xP & x<0);
Vx=Vx1+Vx2;
Vmax=3;
EF=Vx(1)+Vmax/2-k*T*log(NA/ni);
EX=-diff(Vx);
PX=KS*eO*diff(EX);
 
%Plotting the results
close
%Plot for  Energy Band Diagram
subplot(4,1,1)
plot(x,-Vx+EG/2+Vmax/2);
axis([xleft xright 0 Vmax]);
axis('off');
title('Band Diagram at Equilibrium');
hold on
plot(x,-Vx-EG/2+Vmax/2);
plot(x,-Vx+Vmax/2,'w:');
plot([xleft xright],[EF EF],'w');
plot([0 0],[0.15 Vmax-0.5],'w--');
text(xleft*1.08,(-Vx(1)+EG/2+Vmax/2-.05),'Ec');
text(xright*1.02,(-Vx(200)+EG/2+Vmax/2-.05),'Ec');
text(xleft*1.08,(-Vx(1)-EG/2+Vmax/2-.05),'Ev');
text(xright*1.02,(-Vx(200)-EG/2+Vmax/2-.05),'Ev');
text(xleft*1.08,(-Vx(1)+Vmax/2-.05),'Ei');
text(xright*1.02,EF-.05,'EF');
set(gca,'DefaultTextUnits','Normalized')
text(.18,0,'p-side');
text(.47,0,'x=0');
text(.75,0,'n-side');
set(gca,'DefaultTextUnits','data')
hold off

%Plot for Electric Field
subplot(4,1,3)
plot(x(:,1:199),EX);
ylabel('E(x)');
xlabel('x');
title('Electric Field');
grid;

%Plot for Electrostatic Potential
subplot(4,1,2)
plot(x,Vx);
ylabel('V(x)');
xlabel('x');
title('Electrostatic Potential');
grid;

%Plot for Charge Density
subplot(4,1,4)
plot(x(:,1:198),PX);
ylabel('P(x)');
xlabel('x');
title('Charge Density');
grid;

