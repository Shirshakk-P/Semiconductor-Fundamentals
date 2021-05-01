 
%Problem 4 Calculations 
clc;
 
%Defining Constant values;
k=8.617e-5;
Nv=2.033e19;
delE=0.045;
gA=4;
NA1=2e18;
NA2=2e16;
T=100;
for i=1:5
    N(1,i)=(Nv*exp(-delE/(k*i*T)))/gA;
    p1(1,i)=(N(1,i)/2)*(sqrt((1+(4*NA1/N(1,i))))-1);
    p2(1,i)=(N(1,i)/2)*(sqrt((1+(4*NA2/N(1,i))))-1);
    Ef1(1,i)=-1*k*i*T*log(p1(1,i)/Nv);
    Ef2(1,i)=-1*k*i*T*log(p2(1,i)/Nv);
end
disp("Values for Hole Concentrations at NA1");
disp(p1');
disp("Values for the corresponding Fermi Levels at NA1");
disp(Ef1');
disp("Values for Hole Concentrations at NA2");
disp(p2');
disp("Values for the corresponding Fermi Levels at NA2");
disp(Ef2');
