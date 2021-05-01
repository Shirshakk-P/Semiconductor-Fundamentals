%Problem 1:
clear;
neta_values=[-5:0.1:5];
approx_conc=exp(neta_values);
function y=fermi_dirac(eta,etac);
    y=(eta^(1/2))/(1+exp(eta-etac));
end
for i=1:size(neta_values,2)
    etac=neta_values(i);
    fd(1,i)=quad(@(eta)fermi_dirac(eta,etac),0,inf);
end
ans=2*fd/(pi^(1/2));
%Plot
semilogy(neta_values,ans,neta_values,approx_conc);
xlabel('[(Ef-Ec)/kT] or [(Ev-Ef)/kT]')
title('Equilibrium Carrier Concentration');
legend('Exponential','Fermi-Dirac Integral');
grid;
