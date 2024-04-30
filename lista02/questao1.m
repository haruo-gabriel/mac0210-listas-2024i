% questao1
% Como executar:
% > octave
% >> run('questao1.m')

% format long g;

fileID = fopen('output','w');

k        = 10000;
soma_i   = 0.0;
soma_ii  = 0.0;
soma_iii = 0.0;

% (i) Implementação direta
for n = 1:k
  add = 1/n;
  soma_i += add;
  % fprintf(fileID, "%.15f\n", add);
end

% (ii) Usando arredondamento para 5 casas decimais
for n = 1:k
  add = arredonda(1/n,5);
  soma_ii += add;
  fprintf(fileID, "%.15f %f\n", add, add);
end


% (iii) Usando arredondamento para 5 casas decimais na ordem inversa
for n = k:-1:1
  add = arredonda(1/n,5);
  soma_iii += add;
  % fprintf(fileID, "%.15f\n", add);
end

soma_i
printf("soma_i   = %.15f, %f\n", soma_i  , soma_i);
printf("soma_ii  = %.15f, %f\n", soma_ii , soma_ii);
printf("soma_iii = %.15f, %f\n", soma_iii, soma_iii);

% fprintf(fileID, "\n%.15f, %f\n", soma_ii , soma_ii);
fprintf(fileID, "\n%.15f, %f\n", soma_ii , soma_ii);
% fprintf(fileID, "\n%.15f, %f\n", soma_iii, soma_iii);

fclose(fileID);

#{
Comentários:

Os resultados das somas foram, respectivamente,
  soma_i   = 9.787606
  soma_ii  = 9.787614
  soma_iii = 9.787614

Note que
  soma_i < soma_ii, soma_iii

Uma hipótese simples para tentar explicar o por que de soma_i ser a menor é que a função `arredonda` faz o arredondamento para cima. Logo, tanto a soma_ii quanto a soma_iii acabaram sendo maiores que a soma_i pois acumularam os erros de arredondamento.

#}