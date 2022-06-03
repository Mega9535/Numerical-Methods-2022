function [a,b, a2, b2]=linearization_of_power_equation(x, y)
%from y=a*x^b to log y=b*log x + log a;
for n=1:length(x)
    x(n)=log10(x(n));
    y(n)=log10(y(n));
[a, b]=linear_regression(x, y);
%a2=10^b  b2=a; y=a2*x^b2;
a2=10^(b);
b2=a;
end