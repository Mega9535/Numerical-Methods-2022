function y1= linear_interpolation(x,x0, x1, fx0, fx1)
y1=fx0+((fx1-fx0)/(x1-x0))*(x-x0);
end