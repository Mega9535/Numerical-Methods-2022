function modified_eulers_method()
a=input('From: ');
b=input('To: ');
h=input('Step size: ');
x0=input('x0: ');
y0=input('y0: ');
n=(b-a)/h;
n=cast(n, "uint8");
x_s=zeros(1,n+1);
y_s=zeros(1, n+1);
x_s(1)=a;
x_s(end)=b;
y_s(1)=y0;
var=h;
for i=2:n
    x_s(i)=a+var;
    var=var+h;
end

for i=2:n+1
    y_s(i)=y_s(i-1)+h*(y_s(i-1)-x_s(i-1));   
end

for i=2:n+1
    py=y_s(i-1)+h*(8+7*(y_s(i-1)/x_s(i-1)));
    y_s(i)=y_s(i-1)+(h/2)*((8+7*(y_s(i-1)/x_s(i-1)))+(8+7*(py/x_s(i-1))));
end
format long
A=[x_s;y_s];
array2table(A, "RowNames",{'x','y'})
end%%end modified eulers methods