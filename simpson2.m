function result=simpson2()
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
h=(b-a)/n;
var=h;
multiples_three=[];
val_mt=0;
rest_x=[];
val_rx=0;
for i=2:n
    x_s(i)=a+var;
    var=var+h;
end
for i=2:length(x_s)-1
    if mod(i, 3)==1
        multiples_three(end+1)=x_s(i);
    else
        rest_x(end+1)=x_s(i);
    end
end
for i=1:length(multiples_three)
    val_mt=val_mt+f(multiples_three(i));
end
for i=1:length(rest_x)
    val_rx=val_rx+f(rest_x(i));
end
val_rx=3*val_rx;
val_mt=2*val_mt;
r=(3/8)*h;
result=r*(f(a)+f(b)+val_mt+val_rx);
end