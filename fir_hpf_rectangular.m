clc
clear all
close all
N=40;
t=-N/2+1:N/2;
n=-N:.1:N;
hdn=sinc(n);
hdf=fft(hdn);

subplot(2,2,1)
plot(n,hdn)

subplot(2,2,2)
plot(n,hdf)
Wn=0;
len_hdn=length(hdn);
mid=((len_hdn+1)/2)-N/2;
hn=zeros(N,1);
for i=1:N/2
    hn(i)=Wn*hdn(mid+i);
end
subplot(2,2,3)
stem(t,hn)

Hf=fft(hn);
subplot(2,2,4)
stem(t,Hf)
