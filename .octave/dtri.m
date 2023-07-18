function [discrete_triangle] = dtri(timeInterval, triLength = 1)
  % Se genera una señal triangulo de tiempo discreto
  % Siguiendo la regularización: triN[n], es de longitud 2N-1 y triN[0]=N
  %
  % ARGUMENTOS:
  % - timeInterval: es un 'vector' del intervalo de tiempo que se quiere considerar, tiene que tener paso 1
  %
  % - triLength: es un 'entero' de la longitud del triangulo, para triN[n], triLength=N.
  %
  % RETORNA:
  % discrete_triangle: es un 'vector' que contiene la imagen triN[timeInterval].

  discrete_triangle = NaN;

  if (length(timeInterval) < 2)
    help dtri;
    dispc("ERROR: se esperaba un vector de tiempo valido", "red");
    return;
  elseif (timeInterval(2)-timeInterval(1) != 1)
    help dtri;
    dispc("ERROR: se esperaba que el argumento 'timeInterval' se de paso 1", "red");
    return;
  end

  % TODO: verificar si es entero
  if (triLength <= 0)
    help dtri;
    dispc("ERROR: se esperaba que el argumento 'triLength' sea un entero positivo mayor a 0", "red");
    return;
  end

  eqDTri = @(n) (n+triLength).*(n>=(1-triLength)).*(n<0) + (-n+triLength).*(n<=(triLength-1)).*(n>=0);

  discrete_triangle = eqDTri(timeInterval);

end
