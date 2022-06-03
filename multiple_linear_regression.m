function [a_s, r_2]=multiple_linear_regression(x1,x2,y)
sum_x1=0;
sum_x1squared=0;
sum_x2=0;
sum_x2squared=0;
sum_x1timesx2=0;
sum_y=0;
sum_x1timesy=0;
sum_x2timesy=0;
%St=0;
%Sr=0;
for n=1:length(x1)
    sum_x1=sum_x1+x1(n);
    sum_x2=sum_x2+x2(n);
    sum_x1timesx2=sum_x1timesx2+(x1(n)*x2(n));
    sum_y=sum_y+y(n);
    x1squared=x1(n)^2;
    x2squared=x2(n)^2;
    sum_x1squared=sum_x1squared+x1squared;
    sum_x2squared=sum_x2squared+x2squared;
    x1timesy=x1(n)*y(n);
    x2timesy=x2(n)*y(n);
    sum_x1timesy=sum_x1timesy+x1timesy;
    sum_x2timesy=sum_x2timesy+x2timesy;
end%end for loop
%y_mean=sum_y/length(y);
%{ 
for n=1:length(x)
    valSt=(y(n)-y_mean)^2;
    St=valSt+St;
    valSr=(y(n)-a0-a1*x(n))^2;
    Sr=valSr+Sr;
%Coefficient of determination
r2=(St-Sr)/St;
%Correlation coefficient
r=sqrt(r2);
%}
r1=[length(x1) sum_x1 sum_x2];
r2=[sum_x1 sum_x1squared sum_x1timesx2];
r3=[sum_x2 sum_x1timesx2 sum_x2squared];
A=[r1;r2;r3];
b_s=[sum_y sum_x1timesy sum_x2timesy];
a_s=solve_system_equations(A, b_s);
end%end function