%Problem 2:
clc
%Defining Constants
Tp=1e-6;
GL=1e17;
delPN(1,1)=0;
t(1,1)=0;
for i=1:100
    delPN(1,i)=GL*Tp*(1-exp(-t(1,i)/Tp));
    t(1,i+1)=t(1,i)+1e-6;
end
t=t(:,1:i);
close;
%Plot
plot((t/Tp)',delPN');
ylabel('Del(PN)');
xlabel('t/Tp');
title('Problem 2 Plot');
grid;
 
