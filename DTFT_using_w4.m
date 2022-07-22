clc
close all
clear all
xn=[1 2 3 4];
X=abhay_dtft(xn)

function X=abhay_dtft(xn)
    W=[1 1 1 1;1 -1j -1 1j;1 -1 1 -1;1 i -1 -i];
    X=(xn*W).';
end
