0;

% Interpolação monomial
xi = [0 0.5 1];
yi = exp(xi);
yi = yi.'; % transforma yi em um vetor coluna
c = fliplr(vander(xi)) \ yi;

x = linspace(0,1,1000);

p = c(1) + c(2).*x + c(3).*(x.^2);
expo = exp(x);

# Plot
plot(x,p);
hold on;
plot(x,expo);
legend('aproximação','original');
axis('equal');