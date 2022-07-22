%lpf:s-->s/wc
%hpf:s-->wc/s
%bpf:s-->(s^2+w0^2)/sw,where(w0^2=w1w2)
%w0=sqrt(w1w2),w=w2-w1
%bsf:s-->sw/(s^2+w0^2)

%s=(1-z^-1)/(1+z^-1)
clc;
clear cll;
close all;
N=50;
ohmc=1;Fs=1;
Ts=1/Fs;
wc=tan(ohmc*Ts/2);
sig=-N:0.1:N;
ohm=-N:0.1:N;
w=-N:0.1:N;
r=1;
for i=1:10*N+1
    s(i)=sig(i)+1j*ohm(i);
    p(i)=s(i)/wc;
    z(i)=r*exp(1j*w(i));
    q(i)=((1-(1/z(i)))/(1+(1/z(i))))/wc;
    Hs1(i)=1/(1+s(i));
    Hs2(i)=1/(1+p(i));
    Hs3(i)=1/(1+q(i));
end


subplot(121)
plot(abs(Hs3));
%subplot(122)
%stem(imag(Hs));