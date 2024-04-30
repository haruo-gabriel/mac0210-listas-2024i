% questao1[itemb]
% Como executar: octave questao1\[itemb\].m

% Considere f(x) = sin(x)
format long e;

x0 = 1.2;
h = 10.^[-7:1:-1];
erro_abs = abs(cos(x0) - (sin(x0.+h) - sin(x0.-h))./(2.*h));
erro_teorico = abs(h.^2 * cos(x0) / 6); % erro teórico

% Imprime a tabela
fprintf('    h    | Erro absoluto\n');
fprintf('------------------------\n');
for j = length(h):-1:1
  fprintf('%8.1e | %10.6e\n', h(j), erro_abs(j));
end

#{
A tabela do exemplo 1.2 é a seguinte:

    h   | Erro absoluto
----------------------
 0.1    | 4.716676e-2
 0.01   | 4.666196e-3
 0.001  | 4.660799e-4
 1.e-4  | 4.660256e-5
 1.e-7  | 4.619326e-8

enquanto a tabela requisitada no exercício é:

    h    | Erro absoluto
------------------------
 1.0e-01 | 6.036277e-04
 1.0e-02 | 6.039266e-06
 1.0e-03 | 6.039301e-08
 1.0e-04 | 6.036187e-10
 1.0e-07 | 1.190064e-10

Note que, para h = 1.e-1, 1.e-2, 1.e-3, 1.e-4, 1.e-7:
- Todos os erros na nova tabela são menores que seus respectivos na antiga tabela.
- A ordem do expoente do erro absoluto da antiga tabela é o dobro que a da nova tabela, ou seja, se o erro antigo para h = 0.1 é da ordem de 10^-2, então o novo erro é da ordem de 10^-4.
#}

% Aguarda o usuário inserir um input para continuar o script
printf("\nPressione Enter para encerrar o script.\n");
while (!kbhit())
  pause(1);
end
