% questao5[itemb]

function [raiz, iteracoes] = curt2(a,x0,eps)
  iteracoes = 0;
  g = @(x) x - x^3 + a; % equação do ponto fixo
  x_antes = x0;
  
  while true
    x_depois = g(x_antes);
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
Supondo que as condições do teorema do ponto fixo valem, então para x suficientemente perto da raíz:
    |g'(x)| < 1                           ->  |1 - 3x^2| < 1
->  -1 < 1 - 3x^2 < 1                     ->  -2 < -3x^2 < 0
->  0 < x^2 < 2/3                         ->  -(2/3)^(1/2) < x < (2/3)^(1/2)
->  -(2/3)^(1/2) < a^(1/3) < (2/3)^(1/2)  ->  -(2/3)^(3/2) < a < (2/3)^(3/2)
Logo, a deve estar no intervalo aproximado de (-0.5443,+0.5443) para que o método convirja garantidamente.

#}