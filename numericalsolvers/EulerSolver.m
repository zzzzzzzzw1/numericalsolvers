function [tout,yout] = EulerSolver(f,t,y0)
% INPUT: f(t,y) is an anonymous function that defines
% the right-hand side of the ODE ydot = f(t,y)
% t =[t0 t1 ... tfinal] is a vector of grid points
% with length N
% y0=[a; b; c] is a column vector that contain the
% initial values y(0)=y0.
% OUTPUT:tout is a column vector of grid points.
% yout is an 3 x N matrix containing the solution
% at different grid points.
    
    % Init variables
    N = length(t);
    h = t(2) - t(1);
    yout = zeros(length(y0), N);

    yout(:, 1) = y0;
    
    for i = 1:N-1
        yout(:, i+1) = yout(:, i) + h * f(t(i), yout(:, i));
        % y_i+1 = y_i + h * f(t_i, y_i)
    end
    
    tout = t(:);
end
