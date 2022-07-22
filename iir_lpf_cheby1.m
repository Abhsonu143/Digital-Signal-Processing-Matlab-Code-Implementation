clc;clear all;close all;
Ts=0.2;
Wp=[0.2*pi,0.2*pi,0.2*pi,0.6*pi,0.6*pi];%input('Enter passBand Edge:');%0.2pi
Ws=[0.5*pi,0.5*pi,0.3*pi,0.7*pi,0.7*pi];%input('Enter stopBand Edge:');%0.5,0.4,pi0.4
Ap=[2 2 5 10 10];%input('Enter passBand attenuation magnitude:');%2dB,5
As=[8 15 22 22 60];%input('Enter stopBand attenuation magnitude:');%15,8,dB,25
for i=1:5
    %%%Prewarping frequency
    Op=tan(Wp(i)/2);
    Os=tan(Ws(i)/2);
    %%%calculate Epsilon
    E=(10^(0.1*Ap(i)-1))^0.5;
    E1=(10^(0.1*As(i)-1))^0.5;
    %%%Find order
    N=acosh(E1/E)/(acosh(Os/Op));
    N=ceil(N)
    %%%find cut_off
    Oc=Os/((10^(0.1*As(i))-1)^(1/(2*N)));
    %finding filter function
    H(i)=get_filter_cheby1_lpf(N,E,Op,Oc);
end

bode(H(1),'m-s');
hold on;
bode(H(2),'b-*');
bode(H(3),'g-o');
bode(H(4),'c-d');
bode(H(5),'c-d');
hold off;