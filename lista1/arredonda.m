% questao5[itema]
% Como executar:
% > octave
% > arredonda(123.456, 3)

function x_arredondado = arredonda(x, N)
  if isscalar(x) % Se x for um escalar
    % Multiplica x por 10^N para mover o ponto decimal
    x_shiftado = x * (10^N)
    % Calcula a parte decimal
    parte_decimal = x_shiftado - floor(x_shiftado)
    % Arredonda o último dígito
    if parte_decimal >= 0.5
      x_shiftado_arredondado = floor(x_shiftado + 0.5)
    else
      x_shiftado_arredondado = floor(x_shiftado)
    end
    % Divide por 10^N para mover o ponto decimal de volta
    x_arredondado = x_shiftado_arredondado / (10^N);
  else % Se x for um vetor ou matriz
    % Multiplica x por 10^N para mover o ponto decimal
    x_shiftado = x * (10^N);
    % Calcula a parte decimal
    parte_decimal = x_shiftado - floor(x_shiftado);
    % Arredonda o último dígito
    x_shiftado_arredondado = floor(x_shiftado + 0.5 .* sign(parte_decimal));
    % Divide por 10^N para mover o ponto decimal de volta
    x_arredondado = x_shiftado_arredondado / (10^N);
  end
endfunction