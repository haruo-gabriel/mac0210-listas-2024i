% questao5[itema]

function [x,k] = curt1(a,eps)
  f = @(x) x^3 - a;
  % n = ceil(log2(abs(1-a)/(2*eps))); é o número de iterações
  if a > 0 && a <= 1
    [x,k] = bisseccao(f,a,1,eps);
  else
    [x,k] = bisseccao(f,1,a,eps);
  end
  return
endfunction
