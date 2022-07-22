clc;
clear all;
close all;
%taking design parameters
Wpl=[0.1*pi,0.1*pi,0.1*pi,0.1*pi];%input('Enter lower stopband edge:');
Wsl=[0.4*pi,0.4*pi,0.3*pi,0.2*pi];%input('Enter lower passband edge:');
Wsu=[0.6*pi,0.6*pi,0.7*pi,0.8*pi];%input('Enter upper passband edge:');
Wpu=[0.9*pi,0.9*pi,0.9*pi,0.9*pi];%input('Enter upper stopband edge:');
Ap=[3,3,1,3];   %-3db%%input('Enter passband attenuation:');
As=[18,21,25,21];   %-18db%%input('Enter stopband attenuation:');
for i=1:4
    %prewarping frequencies O=tan(w/2)
    Opl=tan(Wpl(i)/2);
    Osl=tan(Wsl(i)/2);
    Osu=tan(Wsu(i)/2);
    Opu=tan(Wpu(i)/2);
    %Low pass filter prototyping
    Op=1;
    Os=((Opu-Opl)*Osl)/(Opu*Opl-Osl^2);
    %Finding order
    N=log10((10^(0.1*As(i))-1)/(10^(0.1*Ap(i))-1))/(2*log10(Os/Op))
    N=ceil(N)
    % find Low pass filter cut-off
    Oc=Os/((10^(As(i)/10)-1)^(1/(2*N)));
    % find BPF cut-off frequencies
    O0=sqrt(Opu*Opl);
    B=Opu-Opl;
    Oc1=(-B/(2*Oc))+1/2*(sqrt((B^2)/(Oc^2)+4*O0^2));
    Oc2=(B/(2*Oc))+1/2*(sqrt((B^2)/(Oc^2)+4*O0^2));
    H(i)=get_filter_bandstop(N,O0,Oc1,Oc2);
end
%%%

bode(H(1),'m-s');
hold on;
bode(H(2),'b-*');
bode(H(3),'g-o');
bode(H(4),'c-d');
hold off;