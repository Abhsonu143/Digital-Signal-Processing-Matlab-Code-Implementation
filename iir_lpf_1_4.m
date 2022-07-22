clc;clear all;close all;
Wp=[0.2*pi,0.2*pi,0.2*pi,0.2*pi];%input('Enter passBand Edge:');%0.2pi
Ws=[0.5*pi,0.5*pi,0.4*pi,0.4*pi];%input('Enter stopBand Edge:');%0.5,0.4,pi0.4
Ap=[2 2 2 5];%input('Enter passBand attenuation magnitude:');%2dB,5
As=[8 15 15 25];%input('Enter stopBand attenuation magnitude:');%15,8,dB,25
for i=1:4
    %%%Prewarping frequency
    Op(i)=tan(Wp(i)/2);
    Os(i)=tan(Ws(i)/2);
    %%%Find order
    N=log10((10^(0.1*As(i))-1)/(10^(0.1*Ap(i))-1))/(2*log10(Os(i)/Op(i)));
    N=ceil(N)
    %%%find cut_off
    Oc=Os(i)/((10^(0.1*As(i))-1)^(1/(2*N)));
    %finding filter function
    H(i)=get_filter(N,Oc);
end

bode(H(1),'m-s');
hold on;
bode(H(2),'b-*');
bode(H(3),'g-o');
bode(H(4),'c-d');
hold off;