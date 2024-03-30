% questao5[itemb]
% Como executar: octave questao5\[itemb\].m
format long e

t = 0:.002:1;
tt = double(exp(-t) .* (sin(2*pi*t)+2)); % precisão dupla
%rt = single(tt); % precisão simples
n = 5;
rt = arredonda(tt, n); % linha adaptada
round_err = (tt - rt) ./tt;

% Plot
screenSize = get(0, "screensize");
sizeofplot = 850;
figure('Position', [0.5*(screenSize(3)-sizeofplot), 0.5*(screenSize(4)-sizeofplot), sizeofplot, sizeofplot]);
plot (t,round_err,'b-');
title ('error in sampling exp(-t)(sin(2\pi t)+2) single precision');
xlabel('t');
ylabel('roundoff error');

#{
Comentários do plot:

Note que a escala vertical do gráfico, para n=5, tem limitantes ao redor de +1.e-5 e -1.e-5 . Para valores entre n = 1 .. 16, os limitantes da curva são da ordem de +1.e-n e -1.e-n. Para valores maiores de n, mantém-se os limitantes +1.e-16 e -1.e-16 . Uma possível causa é o limite de representação de um número em ponto flutuante ser da ordem de 1.e-16 .
#}

% relative error should be about eta = eps(single)/2
% rel_round_err = max(abs(round_err)) / (eps('single')/2)
rel_round_err = max(abs(round_err)) / (10^(1-n)/2) % linha adaptada

% Aguarda o usuário inserir um input para finalizar o script
printf("\nPressione Enter para finalizar o script.\n");
while (!kbhit())
  pause(1);
end