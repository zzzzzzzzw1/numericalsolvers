function [tout,yout] = RK4Solver(f,t,y0)
% INPUT: f(t,y) is an anonymous function that defines
% the right-hand side of the ODE ydot = f(t,y)
% t =[t0 t1 ... tfinal] is a vector of grid points
% with length N
% y0=[a; b; c] is a column vector that contains the
% initial values y(0) = y0.

% OUTPUT:tout is a column vector of grid points.
% yout is an 3 x N matrix containing the solution
% at different grid points.

%   Initial Variables   
N = length(t);              %   Defines N subject to the lenght of vector t.  
tout = t(:);                %   Column vector output of grid points. 
yout = zeros(length(y0),N); %   Initialise yout 3 x N matrix. 
yout(:,1) = y0;             %   Initial condition - first column of yout matrix. 
c_j = [0 0.5 0.5 1];        %   Intervals for 4th order ERK. 
b_j = [1/6 1/3 1/3 1/6];    %   Weights for 4th order ERK. 

for i = 1:(N-1)
    h = t(i+1)-t(i);        %   Time step (same as Euler's method). 
    
    %  Updating slope values
    xi_1 = f(tout(i)+c_j(1)*h, yout(:,i));
    xi_2 = f(tout(i)+c_j(2)*h, yout(:,i) + 0.5*h*xi_1);
    xi_3 = f(tout(i)+c_j(3)*h, yout(:,i) + 0.5*h*xi_2);
    xi_4 = f(tout(i)+c_j(4)*h, yout(:,i) + h*xi_3);

    %   Weighted sum to obtain output
    yout(:, i+1) = yout(:,i)+h*(b_j(1)*xi_1+b_j(2)*xi_2+b_j(3)*xi_3+b_j(4)*xi_4);
end