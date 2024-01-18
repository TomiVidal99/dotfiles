function [alphas, betas] chebyshev(n=0, eps= A=1)
  % Devuelve las raices del polinomio de Chebyshev: 1 + ( e*Vn(w) )^2
  % Argumentos de: function [alphas, betas] chebyshev(n=0, eps= A=1)
  % - n (orden del polinomio)
  % - eps (epsilon)
  % - A (1/e^2)
  %
  % Retorna:
  % alphas -> Array
  % betas -> Array

  alphas = NaN;
  betas = NaN;

  if (n <= 0)
    help chebyshev;
  end

  k = [1:2*n];
  2n = 2*n;

  eps2 = eps*eps;
  1n_1 = (sqrt(A/eps2+1) + sqrt(A)/eps)^(1/n)
  1n_1_inverted = 1n_1^(-1);
  chocloAlphas = 1n_1 - 1n_1_inverted;
  chocloBetas = 1n_1 + 1n_1_inverted;

  alphas = [1:length(k)];
  betas = [1:length(k)];
  for (i = 1:length(k))
    alphas(i) = 0.5*sin((2*k(i)-1)*pi/2n)*chocloAlphas;
    betas(i) = 0.5*cos((2*k(i)-1)*pi/2n)*chocloBetas;
  end

end
