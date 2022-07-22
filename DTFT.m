clc
close all
clear all
xn=input('Enter a sequence:');
X=abhay_dft(xn)
figure(2)
subplot(2,1,1);
stem(X,'r')
title('real plot of dft');
subplot(2,1,2);
stem(imag(X),'b');
title('img plot of dft');