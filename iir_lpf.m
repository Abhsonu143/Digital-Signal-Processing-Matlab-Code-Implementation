clc;clear all;close all;
Oc=1;%input('Enter cutoff ohm:');
Fs=1;%input('Enter sampling frequency:');
Ts=1/Fs;
Wc=tan(Oc*Ts/2);
num=[-1,1];
den=[1,1];
H=tf(num,den);
S=(2/Ts)*H;
p=Wc/S;
H1=1/(p+1);
bode(H1);