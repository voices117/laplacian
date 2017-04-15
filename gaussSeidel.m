function x = gaussSeidel(A, b, x0, tolerance, max_iterations)
    % Solves a linear system `Ax=b` for x using the gaussSeidel method, using `x0` as the starting
    % value for the solution until the error goes under `tolerance` or `max_iterations` are reached.

    % helper variables
    x = x0;
    n = size(x0)(1);

    x_prev = x0;
    iter = 0;
    err = inf;
    while(iter < max_iterations && err > tolerance)
        % Gauss-Seidel loop
        for i = 1:n
            aux = 0;
            for j = 1:n
                if j == i
                    continue
                end
                aux += A(i, j) * x(j);
            end
            x(i) = (1/A(i, i)) * (b(i) - aux);
        end

        % calculates the error
        err = max(abs(x_prev - x));
        x_prev = x;
        iter += 1;
    end

    printf("converged at iteration %d with error %f\n", iter, err);
end
