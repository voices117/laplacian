function x = SOR(A, b, w, x0, tolerance, max_iterations)
    % Solves a linear system `Ax=b` for x using the SOR method, using `x0` as the starting value
    % for the solution until the error goes under `tolerance` or `max_iterations` are reached.
    % `w` is the relaxation factor to be used.

    % helper variables
    x = x0;
    n = size(x0)(1);

    x_prev = x0;
    iter = 0;
    err = inf;
    while(iter < max_iterations && err > tolerance)
        % SOR loop
        for i = 1:n
            aux = 0;
            for j = 1:n
                if j == i
                    continue
                end
                aux += A(i, j) * x(j);
            end
            x(i) = (1-w) * x(i) + (w/A(i, i)) * (b(i) - aux);
        end

        % calculates the error
        err = norm(x_prev - x);
        x_prev = x;
        iter += 1;
    end

    printf("converged at iteration %d with error %f\n", iter, err);
end
