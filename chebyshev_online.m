clc;
clear all;
close all;



digitalf = 1;
T = 1;
T1 = 2*pi*T;
order =1;
analogf = 2*tan(digitalf/2)



analogfreq = 0:0.01:10;
p = length(analogfreq);
analog = zeros(size(analogfreq));
for j = 1:p
s = analogfreq(j);
m = s/analogf;
if abs(m) <= 1
cn = cosd(order*acosd(m));
else
cn = cosh(order*acosh(m));
end
analog(j) = 1/sqrt((1 + 0.25*(cn^2)));
end





x = -T/2:0.01:T/2;
k = length(x);
analog2 = zeros(size(x));
for j = 1:k
z = exp(i*2*pi*x(j));
s = 2*(z-1)/(z+1);
m = abs(s)/analogf;
if abs(m) <= 1
cn = cosd(order*acosd(m));
else
cn = cosh(order*acosh(m));
end
analog2(j) = 1/sqrt((1 + 0.25*(cn^2)));
end



figure(1);
plot(analogfreq,abs(analog));
hold on;



%figure(2);
%plot(x,digital);



figure(2);
plot(x,analog2);
hold on;
order =2;
analogf = 2*tan(digitalf/2)



analogfreq = 0:0.01:10;
p = length(analogfreq);
analog = zeros(size(analogfreq));
for j = 1:p
s = analogfreq(j);
m = s/analogf;
if abs(m) <= 1
cn = cosd(order*acosd(m));
else
cn = cosh(order*acosh(m));
end
analog(j) = 1/sqrt((1 + 0.25*(cn^2)));
end





x = -T/2:0.01:T/2;
k = length(x);
analog2 = zeros(size(x));
for j = 1:k
z = exp(i*2*pi*x(j));
s = 2*(z-1)/(z+1);
m = abs(s)/analogf;
if abs(m) <= 1
cn = cosd(order*acosd(m));
else
cn = cosh(order*acosh(m));
end
analog2(j) = 1/sqrt((1 + 0.25*(cn^2)));
end



figure(1);
plot(analogfreq,abs(analog));
hold on;



%figure(2);
%plot(x,digital);



figure(2);
plot(x,analog2);
hold on;
order =3;
analogf = 2*tan(digitalf/2)



analogfreq = 0:0.01:10;
p = length(analogfreq);
analog = zeros(size(analogfreq));
for j = 1:p
s = analogfreq(j);
m = s/analogf;
if abs(x) <= 1
cn = cosd(order*acosd(m));
else
cn = cosh(order*acosh(m));
end
analog(j) = 1/sqrt((1 + 0.25*(cn^2)));
end





x = -T/2:0.01:T/2;
k = length(x);
analog2 = zeros(size(x));
for j = 1:k
z = exp(i*2*pi*x(j));
s = 2*(z-1)/(z+1);
m = abs(s)/analogf;
if abs(m) <= 1
cn = cosd(order*acosd(m));
else
cn = cosh(order*acosh(m));
end
analog2(j) = 1/sqrt((1 + 0.25*(cn^2)));
end



figure(1);
plot(analogfreq,abs(analog));
hold on;



%figure(2);
%plot(x,digital);



figure(2);
plot(x,analog2);
legend('n=3');
hold on;
order =4;
analogf = 2*tan(digitalf/2)



analogfreq = 0:0.01:10;
p = length(analogfreq);
analog = zeros(size(analogfreq));
for j = 1:p
s = analogfreq(j);
m = s/analogf;
if abs(m) <= 1
cn = cosd(order*acosd(m));
else
cn = cosh(order*acosh(m));
end
analog(j) = 1/sqrt((1 + 0.25*(cn^2)));
end





x = -T/2:0.01:T/2;
k = length(x);
analog2 = zeros(size(x));
for j = 1:k
z = exp(i*2*pi*x(j));
s = 2*(z-1)/(z+1);
m = abs(s)/analogf;
if abs(m) <= 1
cn = cosd(order*acosd(m));
else
cn = cosh(order*acosh(m));
end
analog2(j) = 1/sqrt((1 + 0.25*(cn^2)));
end



figure(1);
plot(analogfreq,abs(analog));
legend('n=1','n=2','n=3','n=4');
%figure(2);
%plot(x,digital);



figure(2);
plot(x,analog2);
legend('n=1','n=2','n=3','n=4');