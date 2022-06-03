function result=simpson()
syms x;
x=input('Enter function in plain text: ');
f=x;
f=matlabFunction(f);
disp(f);
n=input('Enter the number of intervals: ');
b=input('Enter the upper limit of integration: ');
a=input('Enter the lower limit of integration: ');
x_s=zeros(1,n+1);
x_s(1)=a;
x_s(end)=b;
val_o=0;
val_e=0;
h=(b-a)/n;
var=h;
odd_x=[];
even_x=[];
for i=2:n
    x_s(i)=a+var;
    var=var+h;
end
for i=2:length(x_s)-1
    if mod(i,2)~=0
        even_x(end+1)=x_s(i);
    end
    if mod(i, 2)==0
        odd_x(end+1)=x_s(i);
    end
end
%%evaluate odd
for i=1:length(odd_x)
    val_o=val_o+f(odd_x(i));
end
for i=1:length(even_x)
    val_e=val_e+f(even_x(i));
end
r=((b-a)/(3*n));
result=r*(f(a)+f(b)+4*val_o+2*val_e);
end