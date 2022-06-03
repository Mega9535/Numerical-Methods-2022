function y= newton_interpolating_polynomials(n, x, x_s, y_s)
b_s=zeros(1, n+1);
b_s(1)=y_s(1);
b_s(2)=(y_s(2)-y_s(1))/(x_s(2)-x_s(1));
b_slast=b_s(2);
last_termx=x-x_s(1);
for i=3:n+1
    term=(y_s(i)-y_s(i-1))/(x_s(i)-x_s(i-1));
    disp(i)
    disp(term)
    %disp(b_slast)
    b_s(i)=(term-b_slast)/(x_s(i)-x_s(1));
    b_slast=b_s(i);
    %disp(b_slast)
end%end for 

y=b_s(1);
for i=1:n+1
    if i==1
        continue
    elseif i==2
        y=y+(b_s(i)*last_termx);
    else
        termx=x-x_s(i-1);
        myterm=termx*last_termx;
        y=y+(b_s(i)*(myterm));
        last_termx=termx;
    end%end if
end%end for
%%only works for n=1 and n=2, got tired of coding

end%end function