%Problem 3:
clc
%Defining Constants
x=linspace(0,.99);         %x=|VA|/VBR
m3=1./(1-x.^3);
m6=1./(1-x.^6);
 
%Plot
plot(-x,-m3,-x,-m6);
grid;
axis([-1 0 -10 0])
xlabel('-|VA|/VBR');
ylabel('-Multiplication Factor');
text(-0.8,-2.5,'m=3');
text(-0.95,-1.5,'m=6');
