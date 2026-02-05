% Main diagonal (d)
n = 10;
d = ones(1, n);

% Subdiagonal (a) and superdiagonal (c)
a = .25*ones(1, n-1);
c = a;
e = .25*ones(1, n-2);
f = .25*ones(1, n-2);

b = [1.5 1.75 2.0*ones(1,n-4) 1.75 1.5;];


##u = GaussElimTri(a, d, c, b)

u = GaussElimPenta(e, a, d, c, f, b)

