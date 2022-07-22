clc;
clear all;
close all;
x=input('Enter a 8-length sequence:');
N=length(x);
for k=1:N/2
    W=cal_Wn(N,k-1);
    Xe(k)=x(k)+x(k+N/2);
    Xo(k)=(x(k)-x(k+N/2))*W;
end
for k=1:N/4
    W=cal_Wn(N/2,k-1);
    Xee(k)=Xe(k)+Xe(k+N/4);
    Xeo(k)=(Xe(k)-Xe(k+N/4))*W;
    Xoe(k)=Xo(k)+Xo(k+N/4);
    Xoo(k)=(Xo(k)-Xo(k+N/4))*W;
end
for k=1:N/2
    W=cal_Wn(N/4,0);
    if k==1
    X(k)=Xee(k)+Xee(k+N/8);
    X(k+1)=(Xee(k)-Xee(k+N/8))*W;
    end
    if k==2
        X(2*k-1)=Xeo(k-1)+Xeo(k-1+N/8);
        X(2*k)=(Xeo(k-1)-Xeo(k-1+N/8))*W;
    end
    if k==3
        X(2*k-1)=Xoe(k-2)+Xoe(k-2+N/8);
        X(2*k)=(Xoe(k-2)-Xoe(k-2+N/8))*W;
    end
    if k==4
        X(2*k-1)=Xoo(k-3)+Xoo(k-3+N/8);
        X(2*k)=(Xoo(k-3)-Xoo(k-3+N/8))*W;
    end
end
%obtained output is in bit reversed format
%to get desired output we have to reverse it again
X=bitrevorder(X);
figure(2)
subplot(211)
stem(X,'b');
title('Real part of dif fff');
subplot(212)
stem(imag(X),'r');
title('Img part of dif fft');


function W=cal_Wn(N,k)
    W=exp((-1j*2*pi/N)*k);
end
