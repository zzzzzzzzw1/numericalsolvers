%   Main program to test all solver functions

%   Set parameter values
rho = 14;
sigma = 10;
beta = 8/3;

%   Define RHS of Lorenz system
f = @(t,x) lorenz(t,x,sigma,rho,beta);

%   Define a vector of equally spaced grid points
k = 5;                  % 1,2,3,4,5 or 6
h = 10^(-k);
tfinal = 100;
t = [0:h:tfinal];

%   Set initial guess
y0 = [-1;3;4];

%   Ask user which method to choose to solve the Lorenz system of eqns.
method = input('Please select "EulerSolver", "RK4Solver" or "IRK4Solver" to solve (1) = ', 's')

if strcmp(method, 'EulerSolver')
    [tout, Y] = EulerSolver(f,t,y0);
elseif strcmp(method, 'RK4Solver')
    [tout, Y] = RK4Solver(f,t,y0);
elseif strcmp(method, 'IRK4Solver')
    [tout, Y] = IRK4Solver(f,t,y0);
else
    error('Please select one of the listed methods. \n')
end

%   Solve the system (1) using ode45. 
options = odeset('RelTol', 3.1e-14, 'AbsTol', 1e-16);
[tm, Ym] = ode45(f, t, y0, options);

% Compute maximum absolute error
error_max = max(max(abs(Y-Ym')));
fprintf('Maximum absolute error is %e\n', error_max);

% Plot solution in 3D
figure;
plot3(Y(1, :), Y(2, :), Y(3, :), 'LineWidth', 1.5);
grid on;
xlabel('x'); ylabel('y'); zlabel('z');
title(sprintf('Lorenz system using %s', method));