% Matlab code
l=input('Momentum conjugate (l) ');
m=input('Mass of planet (m) ');
k=input('Force constant (k) ');

a=inputdlg('What you want to input (Total energy E) or (Minimum radius rm)','Input');
if strcmp(a,'rm')
rm=input('Input r(min.)');
E=((l*l)/(2*m*rm*rm))-(k/rm);% calculating E when rmin is known
else
  E=input('Total energy (E)');
end

e = (1+((2*E*l*l)/m*k*k))^(0.5); %calculating eccentricity
e1=num2str(e);
disp(e)
if e>1
    msgbox(['Path of planet is HYPERBOLIC in nature as eccentricity is ',e],'Shape');
elseif e<1
     msgbox(['Path of planet is ELLIPTIC in nature as eccentricity is ',e1],'Shape');
else
    msgbox(['Path of planet is PARABOLIC in nature as eccentricity is ',e1],'Shape');
end
theta=0:0.01:2*pi;
rho = (((l.*l)./(m.*k)))./(1+(((1+(2.*E.*l.*l)./(m.*k.*k)).^0.5).*cos(theta)));
V = -k./rho;
subplot(1,2,1)
polar(theta,V) %plotting potential energy vs theta curve

title('Variation of potential energy');
axis('equal');
for i=1:1:(2*pi)/0.01
    subplot(1,2,2)
   polar(theta,rho) 
hold on;
    polar(theta(i),rho(i),'o')
    title('Path of planet');
    axis('equal');
    pause(0.02)
     hold off;  
end
