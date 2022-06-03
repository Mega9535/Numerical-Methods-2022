function x=solve_system_of_equations(A, b)
%Ax=b;
b=b';
x=A\b;
x=x';
end