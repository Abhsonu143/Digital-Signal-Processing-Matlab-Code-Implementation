function A=flipfft(N,X)
    L=(N-1)/2;
    Xl=X(1:L);
    Xr=X(L+1:end);

    A1=flip(Xl);
    A2=flip(Xr);
    A=[A1 A2];
end