clc
clear all
close all
%%Desired impulse response
N=input('Enter no of samples:');
index=0;
for n1=-(N-1)/2:(N-1)/2
    index=index+1;
    if n1==0
        hd(index)=1;
    else
        hd(index)=sin(n1)/n1;
    end
    n(index)=n1;
end
subplot(321);
stem(hd);
title('Time domain hd[n]');

Xd=fft(hd);
Hd=fftshift(Xd);
subplot(322);
stem(abs(Hd));
title('Frequency domain Hd[n]');

%%%Rectangular window
M=1+(N-1)/5; %%M<N
p=((N-1)/2)-((M-1)/2);
q=((N-1)/2)+((M-1)/2);
for n=1:N
    if(n>=p) && (n<=q)
        wr(n)=1;
    else
        wr(n)=0;
    end
end
subplot(323);
stem(wr);
title('Time domain Rectangular window w[n]');
Wr=fft(wr);
Wr=fftshift(Wr);
subplot(324);
stem(Wr);
title('Frequency domain Rectagular window W[n]');

%%% Truncated impulse response
h=wr.*hd;
subplot(325);
stem(h)
title('Time domain h[n]=w[n].hd[n]');

X=fft(h);
H=fftshift(X);
subplot(326)
stem(H)
title('Frequency domain H[n]=fft(h[n])');

%%Low pass filter(LPF)
fl=1; %low cutoff frequency
fh=N; %fh<=N
for n=1:N
    if(n>=fl) && p+n-1<=N
        H_LPF(n)=H(p+n-1);
    else
        H_LPF(n)=0;
    end
end
figure(2)
subplot(221)
stem(abs(H_LPF))
title('H_LPF[n]')

%%High pass filter(HPF)
fl=100; %low cutoff frequency
fh=N; %fh<=N;

for n=1:N
    if(n>=fl) && p+n-fl<=N
        H_HPF(n)=H(p+n-fl);
    else
        H_HPF(n)=0;
    end
end
subplot(222)
stem(abs(H_HPF))
title('H_HPF[n]')

%%Band pass filter(BPF)
fl=100; %low cutoff frequency
fh=fl+M; %high cutoff frequency:fh<=N;
for n=1:N
    if(n>=fl) && n<=fh
        H_BPF(n)=H(p+(n-fl+1));
    else
        H_BPF(n)=0;
    end
end
subplot(223)
stem(abs(H_BPF))
title('H_BPF[n]')

%%Band stop filter(BSF)
fl=100; %low cutoff frequency
fh=fl+M; %high cutoff frequency
for n=1:N
    if(n<=fl)
        H_BSF(n)=H(((N-1)/2-fl)+n);
    elseif(n>=fh) && ((N-1)/2+n-fh)<=N
        H_BSF(n)=H(((N-1)/2+n-fh));
    else
        H_BSF(n)=0;
    end
end
subplot(224)
stem(abs(H_BSF))
title('H_BSF[n]')