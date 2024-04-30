% questao3[itema]
% Dependências: horner.m
% Como executar:
% > octave
% >> run('questao3[itema].m')

x = linspace(1.921, 2.08, 161);
y_horner = [];
y_direto = [];

for i = 1:length(x)
  y_horner = [y_horner, horner(x(i))];
  y_direto = [y_direto, (x(i)-2)^9];
end

% Plot
figure(1);
plot(x, y_horner, 'r'); 
% hold on;
% plot(x, zeros(size(x)), 'k');
xlabel('x');
ylabel('y');
legend('y_horner');
% legend('y_horner', 'y=0');

figure(2);
plot(x, y_direto, 'b');
% hold on;
% plot(x, zeros(size(x)), 'k');
xlabel('x');
ylabel('y');
legend('y_direto');
% legend('y_direto', 'y=0');

#{
Comentários:
É possível observar no plot que a curva avaliada diretamente é mais suave que a curva avaliada por Horner.
Uma hipótese para explicar isso é que o cálculo por Horner introduz um acúmulo de erros à cada operação feita em p, e portanto os pontos oscilam para cima ou para baixo do seu respectivo valor teórico.
#}