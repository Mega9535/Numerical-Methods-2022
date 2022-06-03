function [a_s,r_2]=polynomial_regression(x, y)
y_sum=0;
St=0;
Sr=0;
m=input("Enter the polynomial's degree: ");
A=zeros(m+1, m+1);
a_s=zeros(1, m+1);
b_s=zeros(1, m+1);
x_sums=zeros(1, 2*m);
xy_sums=zeros(1, m);
for n=1:length(y)
    y_sum=y(n)+y_sum;
end
y_mean=y_sum/length(y);
for n=1:length(y)
    St=((y(n)-y_mean)^2)+St;
end
for i=1:2*m
    for n=1:length(x)
        x_sums(i)=(x(n)^(i))+x_sums(i);
        if i<m+1
            xy_sums(i)=((x(n)^(i))*y(n))+xy_sums(i);
        end
    end
end
for n=1:m+1
    if n==1
        b_s(1)=y_sum;
    else
    b_s(n)=xy_sums(n-1);
    end
end
flag1=0;
flag2=0;
A(1, 1)=length(x);
for i=1:m+1
    for j=1:m+1
        if mod(i, 2)==1
            if i==1
                if j==m+1
                    continue
                else
                A(i, j+1)=x_sums(j);
                end
            else
                A(i, j)=x_sums(j+flag1);
            end
        end
        if mod(i,2)==0
            A(i, j)=x_sums(j+flag2);
        end
        %flag2=flag2+2;
    end%end inner for
    if mod(i, 2)==0
        flag2=flag2+2;
    end
    if mod(i, 2)==1 
        flag1=flag1+1;
    end
end%end last for
a_s=solve_system_equations(A, b_s);
for n=1:length(x)
    x_s=zeros(1, m+1);
    x_s(1)=1;
    for i=1:m %if might be necessary because of indexing
        x_s(i+1)=x(n)^(i);
    end
    x_s=x_s';
    term=((-1*(a_s)*x_s)+y(n))^2;
    Sr=term+Sr;
end
r_2=(St-Sr)/St;
r=sqrt(r_2);
end%end function