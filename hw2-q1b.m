%Question 1: Plotting the Fermi Function for electrons from T=0K to T=400K
clc
%Defining the Constants and the Variables 
k = 8.617e-5;
for i = 1:4
    T=100*i;
    kT = k*T;
    dE(i,1) = -5*kT;
    for j = 1:401
         f(i,j) = 1/(1+exp(dE(i,j)/kT));
         dE(i,j+1) = dE(i,j)+0.1*kT;
    end
end
dE=dE(:,1:j);
 
%Plot 
close
plot(dE',f');
grid;
legend('100K','200K','300K','400K','Location','east');
xlabel('E - EF (in eV)');
ylabel('f(E)');
title('Fermi Function of Electron ');
