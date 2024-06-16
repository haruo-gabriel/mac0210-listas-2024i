0;

% Interpolação monomial
xi = [0 0.5 1];
yi = exp(xi);
yi = yi.' % transforma yi em um vetor coluna
c = fliplr(vander(xi)) \ yi;

x = linspace(0,1,1000);

p = c(1) + c(2).*x + c(3).*(x.^2);
expo = exp(x);

erro = abs(p - expo);
max_erro = ones(1, length(x)) * (exp(1)*sqrt(3)/216);

# Plot
semilogy(x,erro);
hold on
semilogy(x,max_erro);
legend('erro absoluto', 'limitante superior do erro');

% Note que o erro está sempre abaixo da reta do erro limitante teórico.