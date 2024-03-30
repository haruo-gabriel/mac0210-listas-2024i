% questao1[itemc]
% Como executar: octave questao1\[itemc\].m

% Considere f(x) = sin(x)
format long e;
x0 = 1.2;
h = 10.^[-20:0.5:0];
erro_abs = abs(cos(x0) - (sin(x0.+h) - sin(x0.-h))./(2.*h));
erro_teorico = abs(h.^2 * cos(x0) / 6);

#{
Note que, para h = 10^-20 .. 10^0:
- A curva de erro teórico da nova tabela é muito mais íngreme, ou seja, o novo erro teórico é mais preciso.
- Na nova tabela, a partir de h = 10^(-4.5) o erro absoluto começa a seguir o erro teórico. Na antiga tabela, a partir de h = 10^(-7.5) o erro absoluto começa a seguir o erro teórico. Para valores menores de h, ambos os métodos ainda carregam bastante erros de arredondamento.
#}

% Plot
screenSize = get(0, "screensize");
sizeofplot = 850;
figure('Position', [0.5*(screenSize(3)-sizeofplot), 0.5*(screenSize(4)-sizeofplot), sizeofplot, int32((16/21)*sizeofplot)]);
loglog (h, erro_abs, 'b-*');
hold on
loglog (h(erro_teorico >= 10^-15), erro_teorico(erro_teorico >= 10^-15), 'r-');
xlabel('h');
ylabel('Erro absoluto (azul) e erro teórico (vermelho)');
title('Aproximação de sin''(1.2)');

% Aguarda o usuário inserir um input para finalizar o script
printf("\nPressione Enter para encerrar o script.\n");
while (!kbhit())
  pause(1);
end