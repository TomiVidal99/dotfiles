function [CAJ] = caj(n)
  % Función cajón.
  % Acepta un parámetro 'n', REQUERIDO.
  % 'n' es un vector de tiempo o variable independiente.

  caj = @(t) (t>=-.5).*(t<=.5);
  CAJ = caj(n);
end
