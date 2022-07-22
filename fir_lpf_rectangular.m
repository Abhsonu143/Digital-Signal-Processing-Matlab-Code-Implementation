clc
clear all
close all
syms t;
N=40;
f=-N/2+1:N/2;
n=-N:.1:N;
hdn=sinc(n);
hdf=fft(hdn);

subplot(3,2,1)
plot(n,hdn)
title('hdn vs n:time domain');

subplot(3,2,2)
plot(n,hdf)
axis([-N -(N-N/4) -11 11]);
title('hdf vs n:frequency domain');
Wn=ones(N,1);
len_hdn=length(hdn);
mid=((len_hdn+1)/2)-N/2;
for i=1:N
    hn(i)=Wn(i)*hdn(mid+i);
end
subplot(3,2,3)
stem(f,hn)
title('hn vs f:time domain');

Hf=fft(hn);
Hf=fftshift(Hf);
subplot(3,2,4)
stem(f,Hf)
title('Hf vs f:frequency domain');

subplot(3,2,5);
stem(f,Wn);
axis([-N N -1.5 1.5]);
title('window function');