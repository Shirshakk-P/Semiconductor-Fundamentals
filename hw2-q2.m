Question 2:
    Plotting the Density of States,Fermi functions for electrons
    and holes and Carrier concentrations for Si
%}
 
%Defining Constant values
h=6.5821e-16;
k=8.617e-5;
T=300;
mn=9.24e8;
mp=4.13e8;
Pi=pi*pi;
kT=k*T;
Ec=0.56;
Ev=-0.56;
E1(1,1)=Ec;
E2(1,1)=Ev;
diffE1(1,1)=0;
diffE2(1,1)=0;
gc(1,1)=0;
gv(1,1)=0;
dE(1,1)=-3*kT;
dE1(1,1)= -4*kT;
dE2(1,1)= 4*kT;
for i=1:50
    E1(1,i+1)=E1(1,i)+0.1;
    diffE1(1,i+1)=E1(1,i+1)-Ec;
    gc(1,i+1)=(mn*sqrt(2*mn*(diffE1(1,i+1))))/Pi*(h^3);
    E2(1,i+1)=E2(1,i)-0.1;
    diffE2(1,i+1)=Ev+E2(1,i+1);
    gv(1,i+1)=mp*sqrt(2*mp*(-diffE2(1,i+1)))/Pi*(h^3);
    f(1,i)=1/(1+exp(dE(1,i)/kT));
    dE(1,i+1)=dE(1,i)+0.1*kT;
end
for j=1:50
    f1(1,j)=1/(1+exp(dE1(1,j)/kT));
    dE1(1,j+1)=dE1(1,j)+0.1*kT;
end
for l=1:50
    f2(1,l)=1/(1+exp(dE2(1,l)/kT));
    dE2(1,l+1)=dE2(1,l)-0.1*kT;
end
dE=dE(:,1:i);
dE1=dE1(:,1:j);
dE2=dE2(:,1:l);
concec=gc(:,1:50).*f;
concev=gv(:,1:50).*(1-f);
concec1=gc(:,1:50).*f1;
concev1=gv(:,1:50).*(1-f1);
concec2=gc(:,1:50).*f2;
concev2=gv(:,1:50).*(1-f2);
close
 
%Plot for the Density of States at (n=p)
subplot(3,3,1)
plot(gc,E1);
yline(Ec);
hold on
plot(gc,E2);
yline(Ev);
title('Density of states at (n=p)');
ylabel('E (in eV)');
xlabel('E-Ec (in eV)');
hold off
grid;
 
%Plot for Fermi Function for n=p
subplot(3,3,2)
plot(dE',f');
hold on
plot(dE',(1-f)');
title('Fermi Function for (n=p)');
xlabel('E-EF(in eV)');
ylabel('f(E)');
hold off
grid;
 
%Plot for Carrier Concentration at n=p
subplot(3,3,3);
plot(concec',E1(:,1:50)');
yline(Ec);
hold on
plot(concev',E2(:,1:50)');
yline(Ev);
title('Carrier Concentration at (n=p)');
xlabel('E (in eV)');
ylabel('f(E)*gc');
hold off
grid;
 
%Plot for Density of States at n>p
subplot(3,3,4);
plot(gc,E1);
yline(Ec);
hold on
plot(gc,E2);
yline(Ev);
title('Density of States at (n>p)');
ylabel('E (in eV)');
xlabel('E-Ec (in eV)');
hold off
grid;
 
%Plot for Fermi Function at n>p
subplot(3,3,5)
plot(dE1',f1');
hold on
plot(dE1',(1-f1)');
title('Fermi Function for (n>p)');
xlabel('E-EF(in eV)');
ylabel('f(E)');
hold off
grid;
 
%Plot for Carrier Concentration at n>p
subplot(3,3,6)
plot(concec1',E1(:,1:50)');
yline(Ec);
hold on
plot(concev1',E2(:,1:50)');
yline(Ev);
title('Carrier Concentration at (n>p)');
xlabel('E (in eV)');
ylabel('f(E)*gc');
hold off
grid;
 
%Plot for Density of States at n<p
subplot(3,3,7);
plot(gc,E1);
yline(Ec);
hold on
plot(gc,E2);
yline(Ev);
title('Density of States at (n<p)');
ylabel('E (in eV)');
xlabel('E-Ec (in eV)');
hold off
grid;
 
%Plot for Fermi Function at n>p
subplot(3,3,8)
plot(dE2',f2');
hold on
plot(dE2',(1-f2)');
title('Fermi Function for (n<p)');
xlabel('E-EF(in eV)');
ylabel('f(E)');
hold off
grid;
 
%Plot for Carrier Concentration at n<p
subplot(3,3,9)
plot(concec2',E1(:,1:50)');
yline(Ec);
hold on
plot(concev2',E2(:,1:50)');
yline(Ev);
title('Carrier Concentration at (n<p)');
xlabel('E (in eV)');
ylabel('f(E)*gc');
hold off
grid;
