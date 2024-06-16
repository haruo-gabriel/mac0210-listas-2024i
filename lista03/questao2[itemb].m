0;

% A função u(x) interpola os pontos (x_i, y_i).
xi = [0 1 3];
yi = [1; 0.9; 0.5];

% Como v(x) = ln(u(x)), então v(x) interpola os pontos (xi, ln(yi)) = (xi, zi).
zi = log(yi);

% Interpolação monomial usando matriz de Vandermonde

% Os gamma serão impressos na sequência gamma_0, gamma_1, gamma_2 do enunciado
% de cima para baixo
gamma = fliplr(vander(xi)) \ zi

x = linspace(0, 6, 1000);

% Note que v(x) = ln(gamma(1)) + gamma(2)*X + gamma(3)*x^2.
% É necessário a correção e^gamma(1) para calcular a função u(x).
u = exp(gamma(1))*exp((gamma(2).*x) + (gamma(3).*(x.^2)));

% Plot
plot(x,u);
hold on;
axis('equal');

% Uma maneira de mostrar que u(x) é qualitativamente diferente
% de uma quadrática é tirando o limite u(x) para x tendendo ao
% infinito. Sabendo os coeficientes gama, então temos que
%   u(x) = 1*e^(-0.042516*x - 0.062844*x^2)
% Note que tal limite para u(x) é 0. Caso fosse uma quadrática,
% então o limite deveria ser igual a infinito.
