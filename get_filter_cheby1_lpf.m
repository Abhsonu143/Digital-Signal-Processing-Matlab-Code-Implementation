function fun=get_filter_cheby1_lpf(N,E,Op,Oc)
    b0=1;
    Ts=0.2;
    num=[1,-1];
    den=[1,1];
    H=filt(num,den,Ts);
    S=(2/Ts)*H;
    p=Oc/S;
    fun=1;
    for k=1:N
        B=((((1+E^2)^0.5)+1)/E)^(1/N);
        r=Op*((B^2)-1)/(2*B);
        R=Op*((B^2)+1)/(2*B);
        theta=pi/2+(2*(k-1)-1)/(2*N);
        sk=r*cos(theta)+1j*R*cos(theta);
        fun=fun*1/(p-sk);
    end
    if mod(N,2)==0
        fun=(b0/(E^2+1))*fun;
    else
        fun=b0*fun;
    end
end