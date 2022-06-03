function y2= quadratic_interpolation(x, x0, x1, x2, fx0, fx1, fx2)
b0=fx0;
b1=(fx1-fx0)/(x1-x0);
b2=(((fx2-fx1)/(x2-x1))-((fx1-fx0)/(x1-x0)))/(x2-x0);
y2=b0+b1*(x-x0)+b2*(x-x0)*(x-x1);
end