% Função dada na aula
function [x,k] = bisseccao(f,a,b,atol)
  # verifica condições importantes
  if a>b || f(a)*f(b)>=0
    disp("erros nos parâmetros iniciais");
    return
  endif
  # calcula o número de passos necessários para atingir a precisão atol
  n = ceil(log2(abs(b-a)/(2*atol)));
  % n = 100;
  # repete até atingir a precisão desejada
  for k=0:n
    x = (a+b)/2;
    if f(a)*f(x)<0
      b = x;
    elseif f(b)*f(x)<0
      a = x;
    else return
    endif
  endfor
endfunction
