function runge_kutta3()
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
    k1=h*(((x_s(i-1)^3)*exp(-2*x_s(i-1))-(2*y_s(i-1))));
    xk2=x_s(i-1)+(h/2);%%does not change
    yk2=y_s(i-1)+(k1/2);%%does not change
    k2=h*((xk2^3*exp(-2*xk2))-(2*yk2));
    xk3=x_s(i-1)+h;%%does not change
    yk3=y_s(i-1)-k1+(2*k2);%%%does not change
    k3=h*((xk3^3*exp(-2*xk3))-(2*yk3));
    y_s(i)=y_s(i-1)+(1/6)*(k1+(4*k2)+k3);%%does not change
end

format long
disp(y_s)
%%end runge-kutta3
end