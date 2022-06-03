function [a,b, a2, b2]=linearization_of_exponential_equation(x, y)
%from y=a*x^b to log y=b*log x + log a;
for n=1:length(x)
    x(n)=log(x(n));
    y(n)=log(y(n));
[a, b]=linear_regression(x, y);
%a2=10^b  b2=a; y=a2*x^b2;
a2=exp(b);
b2=a;
end