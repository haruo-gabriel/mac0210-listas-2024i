% questao5[itemc]

function [raiz,iteracoes] = curt3(a,eps)
  iteracoes = 0;
  f = @(x) x^3 - a;
  fp = @(x) 3*x^2;
  x_antes = (a+2)/3; % x0 inicial

  while true
    x_depois = x_antes - f(x_antes)/fp(x_antes)
    iteracoes = iteracoes + 1;

    if isnan(x_depois)
      printf("Divergiu\n");
      raiz = NaN;
      return
    end

    if abs(x_depois^3 - a) < eps
      raiz = x_depois;
      return
    end
    x_antes = x_depois;
  end
endfunction

#{
Comentários:

Para estimarmos o número de iterações, podemos assumir que

eps =~ |x_{k+1} - x*| =~ M*|x_{k} - x*|^2 =~ ... =~ M^(2^k + 1)*|x_0 - x*|^(2^k)
->  eps =~ M^(2^k + 1)*|x_0 - x*|^(2^k)
->  logM(eps) =~ 2^k + 1 + 2^k * logM(|x_0 - x*|)
->  logM(eps) - 1 =~ 2^k(1 + 2*logM(|x_0 - x*|))
->  log2(logM(eps) - 1) =~ k + log2(1 + 2*logM(|x_0 - x*|))
->  k =~ log2(logM(eps) - 1) - log2(1 + 2*logM(|x_0 - x*|))

Substituindo x_0 = (a+2)/3 e x* = a^(1/3), temos que o número aproximado de iterações é

k =~ log2(logM(eps) - 1) - log2(1 + 2*logM(|(a+2)/3 - a^(1/3)|))
#}