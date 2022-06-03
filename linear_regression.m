function [a1, a0, r]=linear_regression(x, y)
sum_x=0;
sum_y=0;
sum_xtimesy=0;
sum_xsquared=0;
sum_ysquared=0;
St=0;
Sr=0;
for n=1:length(x)
    sum_x=sum_x+x(n);
    sum_y=sum_y+y(n);
    xsquared=x(n)^2;
    ysquared=y(n)^2;
    sum_xsquared=sum_xsquared+xsquared;
    sum_ysquared=sum_ysquared+ysquared;
    xtimesy=x(n)*y(n);
    sum_xtimesy=sum_xtimesy+xtimesy;
end%end for loop
x_mean=sum_x/length(x);
y_mean=sum_y/length(y);
num_a1=(length(x)*sum_xtimesy)-(sum_x*sum_y);
den_a1=(length(x)*sum_xsquared)-(sum_x^2);
a1=num_a1/den_a1;
a0=y_mean-a1*x_mean;
for n=1:length(x)
    valSt=(y(n)-y_mean)^2;
    St=valSt+St;
    valSr=(y(n)-a0-a1*x(n))^2;
    Sr=valSr+Sr;
%total standard deviation
Sy=sqrt((St)/(length(x)-2));
%standard error
Syx=sqrt((Sr)/(length(x)-2));
%Coefficient of determination
r2=(St-Sr)/St;
%Correlation coefficient
r=sqrt(r2);
%{
num_r=den_a1;
den1_r=((length(x)*sum_xsquared)-(sum_x^2))^0.5;
den2_r=((length(x)*sum_ysquared)-(sum_y^2))^0.5;
r=num_r/(den1_r*den2_r);
%}
end%end function
