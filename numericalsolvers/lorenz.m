function y = lorenz(t,x,sigma,rho,beta)
% INPUT: t is a a real value indicating time
% x is a column vector of size 3 x 1
% sigma, rho, beta are parameters of the Lorenz
% equations
% OUPUT: y is a column vector of size 3 x 1 that gives
% the right hand side of the Lorenz equations

%   The variables below represent the RHS values. (i.e x_r means x that is
%   to be substituted into the RHS of the Lorenz equations. 

x_r = x(1);
y_r = x(2);
z_r = x(3);

dxdt = sigma*(y_r-x_r);
dydt = x_r*(rho-z_r)-y_r;
dzdt = x_r*y_r-beta*z_r;

%   Now return the output as vector y. 
y = [dxdt ; dydt ; dzdt];

end
