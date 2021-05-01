%Problem 3:
clc;
clear;
close;
%Computational Parameters 
z=-0.4;
x=linspace(0,1);
 
%P-Theory (y=IDsat/ID0)
Numerator=x-1-(2/3)*(z-1)*(1-((z-x)./(z-1)).^(1.5));
Denominator=-1-(2/3)*(z-1)*(1-(z./(z-1)).^(1.5));
yP=Numerator./Denominator;
%Square-Law Theory
yS=(1-x).^2;
 
%Plot
close
plot(x,yP,x,yS,'--');
grid;
xlabel('VG/VP');
ylabel('IDsat/ID0');
text(0.38,0.4,'Square-Law');
text(0.27,0.2,'IDsat equation');
text(0.8,0.83,'Vbi/VP=-0.4');
