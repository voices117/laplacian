function [A, b] = getLinearSys(h, w)
  % Builds the linear system for the Laplacian equation with Dirichlet conditions with the given
  % width (w) and height (h).

  t_top = round((85782 + 93837 + 90904 + 95772) / (4 * 10^3));
  t_bot = 50;
  t_lat = 50;

  b = zeros(h * w, 1);

  % starts with a zeros matrix
  tmp_b = zeros(h, w);

  % sets the top row
  tmp_b(1, :) = repmat([t_top, 0], [1, w])(1:w);

  % sets the bottom row
  tmp_b(end, :) = repmat([t_bot, 0], [1, w])(1:w);

  % sets the lateral columns
  tmp_b(:, [1, end]) = repmat(t_lat, h, 2);

  % now squishes into a single vector
  b = tmp_b(:);

  A = eye(h*w, h*w);
  for i = (h+1):(h*w - h)
    % handles the condition values in the top/bottom edges
    if mod(i, h) == 0 || mod(i-1, h) == 0
      continue;
    end
    A(i, [1:i+h]) = full(sparse(1, [i-h, i-1, i, i+1, i+h], [1, 1, -4, 1, 1]));
  end
end
