function x = GaussElimTri(a, d, c, b);

  n = length(b);
  x = zeros(n,1);

  for k = 1:(n-1);                   % eliminating in the k-th column
      xmult = a(k)/d(k);          % pre-compute the multiplier
      d(k+1) = d(k+1) - xmult*c(k);   % modify the two entries that change
      b(k+1) = b(k+1) - xmult*b(k);
  endfor

  x(n) = b(n)/d(n);                    % compute the last x(n) (special case)
  for i = (n-1):-1:1;                    % compute the remaining x(i) backwards
      x(i) = (b(i) - c(i)*x(i+1))/d(i);
  endfor
  endfunction
