function result=trapezoidal_integration()
fprintf('1. Trapezoidal Rule\n2.Simpsons 1/3\n3.Simpons3/8\n');
option=input('Enter one of the options listed');
switch option
    case 1
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
val=0;
h=(b-a)/n;
var=h;
for i=2:n
    x_s(i)=a+var;
    var=var+h;
end
for i=2:n
    val=val+f(x_s(i));
end
r=((b-a)/(2*n));
result=r*(f(a)+f(b)+2*val);
%%%%%%%%Simpons 1/3
    case 2 
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
%%%%%%Simpsons 3/8
    case 3
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
    otherwise
        disp('Invalid option. Try again')
end%end switch

end% end function