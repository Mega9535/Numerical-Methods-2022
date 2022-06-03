function system_of_des_euler_method()

a=input('From: ');
b=input('To: ');
h=input('Step size: ');
x0=input('x0: ');
y0=input('y0: ');
z0=input('z0: ');
n=(b-a)/h;
n=cast(n, "uint8");
var=h;
x_s=zeros(1,n+1);
y_s=zeros(1, n+1);
z_s=zeros(1, n+1);
x_s(1)=a;
x_s(end)=b;
y_s(1)=y0;
z_s(1)=z0;
for i=2:n
    x_s(i)=a+var;
    var=var+h;
end
for i=2:n+1
    y_s(i)=y_s(i-1)+h*(z_s(i-1));
    z_s(i)=z_s(i-1)+h*(y_s(i-1)+x_s(i-1));
end
format long
A=[x_s;y_s;z_s];
T=array2table(A, "RowNames",{'x','y','z'})
end%%end euler's method