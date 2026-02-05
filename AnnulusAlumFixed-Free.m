# Annulus, aluminum, fixed/free, n=10

L = 10; % length = 10 m
R = 0.01*(1250/(16*pi))^(1/2); % Longer radius, converted to m
r = 0.01*(450/(16*pi))^(1/2); % Shorter radius, converted to m 
S = pi*(R^2-r^2); % surface area of the cross section, annulus
E = 6.9*10^10; % Young’s modulus for aluminum = 69 GPa = 6.9x10^10Pa
I = (pi*(R^2-r^2))/4; % second moment of inertia
rho = 2700; % mass density of aluminum = 7850 kg/m^3
g = 9.81; % acceleration due to gravity = 9.81 m/s^2
w = S*rho*g; % weight of the beam per unit length (force per unit length due to gravity)
n = 10; % number of subintervals on [0, L]
h = L/n; % discretization spacing
N = n + 1; % number of unknowns to be solved for
% Define the RHS of the system (Same as fixed fixed)
f = -h^4/(E*I) * w * ones(N, 1);
f(1) = f(2) = f(N-1) = 0;
f(N) = 3/2*f(n-2);
% Define the matrix of the system. Notation: d0 is the main diagonal;
% dpn is "main diagonal + n" (superdiagonal n); dmn is "main diagonal - n" (subdiagonal n)
d0 = 6*ones(1, N);
dp1 = dm1 = -4*ones(1, N-1);
dp2 = dm2 = ones(1, N-2);
% Fixed left end
d0(1) = 1.0; d0(2) = 4.0;
dp1(1) = 0.0; dp1(2) = -1.0;
dp2(1) = 0.0; dp2(2) = 0.0;
dm1(1) = 0.0;
dm2(1) = 0.0;
% Free right end
d0(N) = 1.0; d0(N-1) = 5.0; # Changed to 5.0
dp1(N-1) = -2.0; # Changed to -2
dp2(N-2) = 1.0; # Changed to 1.0
dm1(N-1) = -2.0; dm1(N-2) = -4.0; # Changed DM-1 to -2.00 Changed DM1-2 to -4.0
dm2(N-2) = 1.0; dm2(N-3) = 1.0; # Changed both to 1
% Solve for y
y = GaussElimPenta(dm2, dm1, d0, dp1, dp2, f);
% Plots
x = (0:h:L)';

y_exact = -S*rho*g/(24*E*I)*x.^2.*(6*L^2 - 4*L.*x + x.^2); # Changed for exact solutions
subplot(2,1,1);
plot(x, y, "b*", x, y_exact, "r")
title("Deflection of the beam");
xlabel("x"); ylabel("y (deflection)");
grid on;
subplot(2,1,2);
plot(x, abs(y - y_exact), "r")
title("Error: |computed - exact|");
xlabel("x"); ylabel("Error");
grid on;