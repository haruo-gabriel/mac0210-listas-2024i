% questao3[itemb]
% Dependências: horner.m, bisseccao.m
% Como executar:
% > octave
% >> run('questao3[itemb].m')

[raiz_horner, k_horner] = bisseccao(@horner,1.921,2.08,1e-6)
% Solução encontrada: [1.9766, 17]
% horner(1.9766) = 7.9581e-13

[raiz_direto, k_direto] = bisseccao(@(x) (x-2)^9,1.921,2.08,1e-6)
% Solução encontrada: [2, 17]

% Ground-truth
% Solução real: 2

#{
Comentários:
Após 17 passos, a função horner() encontrou a raiz 1.9766, enquanto a função direto() encontrou a raiz 2. A solução real é 2.

Uma hipótese para a horner() ter sido menos precisa que a direto() usa do argumento do item (a) da questão 3: a própria função horner() não é precisa na avaliação. Esses erros herdam para a função bisseccao(), o que resulta em uma avaliação da raíz com tolerância maior que 1e-6.

Enquanto isso, a avaliação da função direto() é naturalmente mais precisa, o que resulta em uma avaliação mais precisa da função bisseccao().
#}