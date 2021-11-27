%signals generation

fs=10000;
T = 10*(1/150); 
t = 0:1/fs:T-1/fs;
s1=220*sin(2*pi*50*t);
s2=7*sin(2*pi*150*t+45);
figure(1)
add=s1+s2;
% %s3=40*sin(2*pi*250*t);
% %s4=30*sin(2*pi*350*t);
% %s5=20*sin(2*pi*460*t);
% %add=s1+s2; %+s3+s4+s5;    %addition of five signals
subplot(611);
plot(add,'r');grid on; hold on;

%arbitrary theta of freq equal to the harmonic to be extracted

x = 6.28*sawtooth(2*pi*150*t);
% subplot(613);
% plot(t,x)
%upper leg
p=sin(2*pi*150*t);
% subplot(614);
% plot(t,p)
e=(add.*p)*2;
subplot(612);
plot(t,e)

%lower leg
q=cos(2*pi*150*t);
f=(add.*q)*2;
%subplot(613);
%plot(t,e)

%filter applied 
fc=20;
[b,a] = butter(4,fc/(fs/2), 'low');
d = filter(b,a,e);
q = filter(b,a,f);
subplot(613)
plot(d,'g');
subplot(614)
plot(q,'r');


%AMPLITUDE
amp= sqrt((d.^2)+(q.^2));
 subplot(615);
 plot(amp,'c');grid on; hold on;
 title('Amplitude');



%Phase
arg=q./d;
phase=atan(arg);
subplot(616);
plot(phase);grid on; hold on;
title('phase');


% %Reconstruction of harmonic
% v=phase+x;
% harmonic=amp.*cos(v); 
% subplot(616);
% plot(harmonic,'cyan');grid on; hold on;
% title('Harmonic');