% questao4.m
% Como executar: octave questao4.m

% Considere f(x) = sin(x)
format long e;

h = 10.^[-20:1:0];
x0 = 1.2;
f0 = sin(x0);
fp = cos(x0); % derivada real
aprox = (2 .* cos(x0+(h./2)) .* sin(h./2)) ./ h; % derivada aproximada
erro_abs = abs(fp - aprox); % erros de discretização e arredondamento
erro_teorico = abs(f0).*(h./2); % erro de discretização sem o erro de arredondamento

% Imprime a tabela
fprintf('    h    | Erro absoluto\n');
fprintf('------------------------\n');
for j = length(h):-1:1
  fprintf('%8.1e | %10.6e\n', h(j), erro_abs(j));
end

#{
A tabela do exemplo 1.3 é a seguinte:

    h   | Erro absoluto
----------------------
 1.e-8  | 4.361050e-10
 1.e-9  | 5.594726e-8
 1.e-10 | 1.669696e-7
 1.e-11 | 7.938531e-6
 1.e-13 | 4.250484e-4
 1.e-15 | 8.173146e-2
 1.e-16 | 3.623578e-1

enquanto a nova tabela é:

    h    | Erro absoluto
------------------------
 1.0e-08 | 4.660195e-09
 1.0e-09 | 4.660196e-10
 1.0e-10 | 4.660194e-11
 1.0e-11 | 4.660217e-12
 1.0e-13 | 4.657386e-14
 1.0e-15 | 4.440892e-16
 1.0e-16 | 0.000000e+00

Note que, para h = 1e-16 .. 1e-8:
- O novo erro absoluto é linear e muito próximo à curva do erro teórico, com valores ordens de grandeza menores que o erro absoluto antigo. Note também que para h = 1e-16, provavelmente por erros de arredondamento, o erro absoluto acaba sendo 0.
- O antigo erro absoluto começa grande e diminui, devido aos erros de cancelamento.
Isso ocorre pois, na nova abordagem, evitamos os erros de cancelamento que ocorreram na antiga abordagem. Portanto, a nova curva do erro absoluto é mais próxima à curva do erro teórico.
#}

% Aguarda o usuário inserir um input para continuar o script
printf("\nPressione Enter para plotar o gráfico.\n");
while (!kbhit())
  pause(1);
end

% Plot
screenSize = get(0, "screensize");
sizeofplot = 850;
figure('Position', [0.5*(screenSize(3)-sizeofplot), 0.5*(screenSize(4)-sizeofplot), sizeofplot, sizeofplot]);
erro_abs(erro_abs == 0) = 0+eps; % Corrige os zeros reais para algum número maior que 0, a fim de conseguir plotá-los
loglog(h, erro_abs, 'b-*', h, erro_teorico, 'r-');
xlabel('h');
ylabel('Erro absoluto (azul) e erro teórico (vermelho)');
title('Aproximação de sin''(1.2)');

% Aguarda o usuário inserir um input para finalizar o script
printf("\nPressione Enter para encerrar o script.\n\n");
while (!kbhit())
  pause(1);
end