% In this function we will be testing convergence of different methods
% to known integrals.

clear all

a = 0; b = 2*pi; % start and end of interval

N = [5, 10, 20, 40, 80, 160, 320];  % increasing number of dof

%% testing first function

f = @(x) sin(x);
true_sol = 0;

f_mat_true = integral(@(x) sin(x), a, b);

% specifics for product integration method
sigma1 = @(x) 1;
m1 = @(x) sin(x); %x.^2;

sigma2 = @(x) 1;
m2 = @(x) 0;

for j = 1: length(N)

    h = (b - a)/N(j);  % step size

    n = [a+h/2:h: b - h/2];  % these are the midpoints of each interval, the nodes

    z(j) = midpoint(f, h, n);

    z_vec(j) = midpoint_vec(f, h, n);

    z_PIM(j) = PIM_midpoint(sigma1, m1, sigma2, m2, h, n);


    
    
end

% TODO: convergence, EOC, more challenging integrals

[z.', z_vec.', z_PIM.']