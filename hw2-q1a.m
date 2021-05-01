%Question 1: Plotting the Fermi Function for electrons and holes at T=300 K
 
%Defining the Constants and the Variables 
k = 8.617e-5;
T=300;
kT = k*T;
dE(1,1) = -5*kT;
for i = 1:101
    f(1,i) = 1/(1 + exp(dE(1,i)/kT));
    dE(1,i +1) = dE(1,i) + 0.1*kT;
end
dE = dE(:,1:i);
close
%Plot 
plot(dE',f');
hold on
 
plot(dE', (1-f)');
hold off
grid;
 
legend('electrons','holes','Location','east');
xlabel('E - EF (in eV)');
ylabel('f(E)');
title('Fermi Function at T = 300K ');

