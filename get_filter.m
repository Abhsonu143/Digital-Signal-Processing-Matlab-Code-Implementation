function H=get_filter(N,Oc)
    Fs=0.5;
    Ts=1/Fs;
    num=[1,-1];
    den=[1,1];
    H=filt(num,den);
    S=(2/Ts)*H;
    p=S/Oc;
    if(N==1)
        H=1/(p+1);
    elseif(N==2)
        H=1/(p^2+1.414*p+1);
    elseif(N==3)
        H=1/((p+1)*(p^2+p+1));
    elseif(N==4)
        H=1/((p^2+0.7654*p+1)*(p^2+1.8478*p+1));
    end
end