clc;
clear all;
close all;
x=input('Enter the sequence:');
N=input('Enter the Point:');
n=length(x);
x=[x zeros(1,N-n)];
xo=x(1:2:end);
xe=x(2:2:end);
XNO=abhay_dtft(xo);
XNE=abhay_dtft(xe);
Wn=exp(1i*2*pi*((0:N/2-1)')/N);
t=Wn.*XNE;
XT=[(XNO+t),(XNE-t)];

function X=abhay_dtft(xn)
    N=length(xn);
    X=zeros(N,1);
    for k=0:N-1
            for n=0:N-1
                X(k+1)=X(k+1)+xn(n+1)*exp(-1j*pi/2*n*k);
            end
    end
end