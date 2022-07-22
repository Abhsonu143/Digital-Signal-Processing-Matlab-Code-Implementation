function X=abhay_dft(xn)
    N=length(xn);
    X=zeros(N,1);
    for k=0:N-1
            for n=0:N-1
                X(k+1)=X(k+1)+xn(n+1)*exp(-1j*2*pi*n*k/N);
            end
    end
end