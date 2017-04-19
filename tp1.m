% error tolerance to stop refining the solution
tol = 10^(-2);

% relaxation factor for the SOR method
w = 1.2;

% maximum number of iteration allowed if tol is not reached
max_iter = 100;

% m = 6
[A b] = getLinearSys(4, 5);
x_octave = A\b;

x_jacobi = jacobi(A, b, zeros(size(b)), tol, max_iter);
printf("norm against octave solution: %f\n\n", norm(x_octave - x_jacobi))

x_gaussSeidel = gaussSeidel(A, b, zeros(size(b)), tol, max_iter);
printf("norm against octave solution: %f\n\n", norm(x_octave - x_gaussSeidel))

x_SOR = SOR(A, b, w, zeros(size(b)), tol, max_iter);
printf("norm against octave solution: %f\n\n", norm(x_octave - x_SOR))

% m = 9
[A b] = getLinearSys(5, 5);
x_octave = A\b;

x_jacobi = jacobi(A, b, zeros(size(b)), tol, max_iter);
printf("norm against octave solution: %f\n\n", norm(x_octave - x_jacobi))

x_gaussSeidel = gaussSeidel(A, b, zeros(size(b)), tol, max_iter);
printf("norm against octave solution: %f\n\n", norm(x_octave - x_gaussSeidel))

x_SOR = SOR(A, b, w, zeros(size(b)), tol, max_iter);
printf("norm against octave solution: %f\n\n", norm(x_octave - x_SOR))
