% Algoritmo extraído do livro
% Assume the polynomial coefficients are already stored
% in array c such that for any real x,
% p(x) = c(1) + c(2)x + c(3)x^2 + ... + c(n+1)x^n
function p = horner(x)
  c = [-512, 2304, -4608, 5376, -4032, 2016, -672, 144, -18, 1];
  n = length(c)-1;
  p = c(n+1);
  for j = n:-1:1
    p = p*x + c(j);
  end
  return
endfunction