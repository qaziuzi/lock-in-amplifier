fs=10000;
T = 20*(1/150); %confused
t = 0:1/fs:T-1/fs;
s1=220*sin(2*pi*50*t);
s2=10*sin(2*pi*150*t);
figure(1)
%subplot(611);
%plot(t,s1,t,s2)
%title('harmonic signal');
add=s1+s2;
% %s3=40*sin(2*pi*250*t);
% %s4=30*sin(2*pi*350*t);
% %s5=20*sin(2*pi*460*t);
% %add=s1+s2; %+s3+s4+s5;    %addition of five signals
 subplot(611);
 plot(add,'r');title('harmonic signal');grid on; hold on;
 
% %arbitrary theta of freq equal to the harmonic to be extracted
 x = 6.28*sawtooth(2*pi*150*t);
 %subplot(613);
 %plot(t,x)
% upper leg
 p=sin(2*pi*150*t);
 %subplot(614);
 %plot(t,p)
 e=(add.*p)*2;
 %subplot(912);
 %plot(t,e)
% 
% lower leg
q1=cos(2*pi*150*t);
 f=(add.*q1)*2;
 %subplot(612);
 %plot(t,e)
% 
% filter applied 
 fc=20;
 [b,a] = butter(4,fc/(fs/2), 'low');
 d = filter(b,a,e).*(0.25*dirac(t) + 1);
 q = filter(b,a,f).*(0.25*dirac(t) + 1);
 subplot(612)
 plot(d,'g');
 title('d');
 subplot(613)
 plot(q,'r');
 title('q');
% 
% H = freqz(b,a);
% hold on
% subplot(613)
% plot(abs(H),'r');
% e_ff=fft(e)
% e_ff_abs=abs(e_ff)
% subplot(615);
 

% 
% AMPLITUDE
 amp= sqrt((d.^2)+(q.^2));
  subplot(614);
  plot(amp,'c');grid on; hold on;
  title('Amplitude');
% 
% 
% 
% Phase
 arg=q./d;
 phase=atan(arg);
 subplot(615);
  plot(phase);grid on; hold on;
  title('phase');
%  Reconstruction of harmonic
% v = phase+x;
% harmonic=amp.*cos(v); 
% subplot(616);
% plot(harmonic,'cyan');grid on; hold on;
% title('Harmonic');