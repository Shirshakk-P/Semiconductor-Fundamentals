%Problem 3:
%Part a:
format short e
 
%Defining constants and Temperature Range
k=8.617e-5;
A=2.510e19;
Eex=0.0074;
T1=200:25:700;
EG0=1.17;
a=4.730e-4;
b=636;
EG=EG0-a.*(T1.^2)./(T1+b);
 
mnr=1.028+(6.11e-4)*T1 - (3.09e-7).*T1.^2;
mpr=0.610+(7.83e-4).*T1 - (4.46e-7).*T1.^2;
%Compuataion of ni
ni=A.*((T1./300).^(1.5)).*((mnr.*mpr).^(0.75)).*exp(-(EG-Eex)./(2.*k.*T1));
j=length(T1);
fprintf('\n \n T          ni\n');
for ii=1:j;
    fprintf('%-10.f%-10.3e\n',T1(ii),ni(ii));
end
 
%Part b:
%Experimental Fit
%Calculation of ni
T2=275:25:375;
k=8.617e-5;
ni=(9.15e19).*(T2./300).^2.*exp(-0.5928./(k*T2));
jj=length(T2);
fprintf('\n \n T          ni\n');
for ii=1:jj;
    fprintf('%-10.f%-10.3e\n',T2(ii),ni(ii));
end
