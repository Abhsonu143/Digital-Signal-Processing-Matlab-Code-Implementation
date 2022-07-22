for k=1:N/4
    W=exp(-1i*2*pi/(_N/2))
    Xe(k)=Xee(k)+W*Xeo(k)
    Xo(k)=Xoe(k)+W*Xoo(k)
    Xe(k)=Xee(k)+W*Xeo(k)
    Xe(k)=Xee(k)+W*Xeo(k)