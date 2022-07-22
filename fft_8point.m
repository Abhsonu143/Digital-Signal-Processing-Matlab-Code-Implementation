clc;
clear all;
close all;
x=input('Enter a 8-length sequence:');
N=length(x);
xe=x(2:2:end);xo=x(1:2:end);
xee=xe(2:2:end);xeo=xe(1:2:end);
xoe=xo(2:2:end);xoo=xo(1:2:end);

Xee=abhay_dft(xee);Xeo=abhay_dft(xeo);
Xoe=abhay_dft(xoe);Xoo=abhay_dft(xoo);
for k=1:N/4
    if k==1 W=cal_Wn(N/2,0);
    else W=cal_Wn(N/2,1);
    end
    Xe(k)=Xeo(k)-W*Xee(k);
    Xe(k+N/4)=Xeo(k)+W*Xee(k);
    Xo(k)=Xoo(k)+W*Xoe(k);
    Xo(k+N/4)=Xoo(k)-W*Xoe(k);
end
for k=1:N/2
    W=cal_Wn(N,k-1);
    next_ind=(k+N/4);
    if(next_ind>N/2) next_ind=mod(next_ind,N/2);
    end
    X(k)=Xo(k)+W*Xe(next_ind);
    X(k+N/2)=Xo(k)-W*Xe(next_ind);
end
display(X);subplot(2,1,1);
stem(X,'b');
title('real plot of dit_fft');
subplot(2,1,2);stem(imag(X),'r');
title('img plot of dit_fft');

function W=cal_Wn(N,k)
    W=exp((-1j*2*pi/N)*k);
end
