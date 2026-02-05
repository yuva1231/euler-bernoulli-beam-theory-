function x = GaussElimPenta(e, a, d, c, f, b)

    n = length(b);
    x = zeros(n, 1);

    for k = 1:(n-2) #eliminate in columns 1, ... , n-2
        xmult = a(k)/d(k);              #elimination in row k+1
        d(k+1) = d(k+1) - xmult*c(k);
        c(k+1) = c(k+1) - xmult*f(k);
        b(k+1) = b(k+1) - xmult*b(k);
        xmult = e(k)/d(k);             #elimination in row k+2
        a(k+1) = a(k+1) - xmult*c(k);
        d(k+2) = d(k+2) - xmult*f(k);
        b(k+2) = b(k+2) - xmult*b(k);
    endfor
    xmult = a(n-1)/d(n-1);            #eliminate in column n-1 (different from above)
    d(n) = d(n) - xmult*c(n-1);
    b(n) = b(n) - xmult*b(n-1);

    % Backward substitution
    x(n) = b(n)/d(n);
    x(n-1) = (b(n-1) - c(n-1)*x(n)) / d(n-1);
    for i = (n-2):-1:1
     x(i) = (b(i) - c(i)*x(i+1) - f(i)*x(i+2)) / d(i);
    endfor


endfunction