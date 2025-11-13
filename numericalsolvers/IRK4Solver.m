function [tout,yout] = IRK4Solver(f,t,y0)
% INPUT: f(t,y) is an anonymous function that defines
% the right-hand side of the ODE ydot = f(t,y)
% t =[t0 t1 ... tfinal] is a vector of grid points
% with length N
% y0=[a; b; c] is a column vector that contain the
% initial values y(0) = y0.
% OUTPUT:tout is a column vector of grid points.
% yout is an 3 x N matrix containing the solution
% at different grid points

% Initialisation
N = length(t);
d = length(y0);
yout = zeros(d, N);
yout(:,1) = y0;
tout = t(:);

%   Coefficients for 2-stage IRK method of order 4
A = [1/4, 1/4-sqrt(3)/6;
     1/4+sqrt(3)/6, 1/4];
b = [1/2;1/2];
c = [1/2-sqrt(3)/6;
     1/2+sqrt(3)/6];

nu = length(c);         %   Gives number of stages. In this case, 2 = length(c). 
max_iterations = 100;   %   Setting max_iterations for fixed point iteration method. 

for i = 1:(N-1)
    h = t(i+1)-t(i);
    y_n = yout(:,i);
    t_n = tout(i);
    
    % Initialisation guesses
    xi_1 = f(t_n,y_n);
    xi_2 = xi_1;
    
    % Fixed point iteration to solve non-linear eqns for xi_1 and xi_2. 
    for iter = 1:max_iterations
        y1 = y_n + h*(A(1,1)*xi_1 + A(1,2)*xi_2);
        y2 = y_n + h*(A(2,1)*xi_1 + A(2,2)*xi_2);

        xi_1 = f(t_n+c(1)*h,y1);
        xi_2 = f(t_n+c(2)*h,y2);
    end
    
    yout(:,i+1) = y_n + h * (b(1)*xi_1 + b(2)*xi_2);
end
end
