function [fig] = plotSignal(signal = {}, labels = {"Title"}, savePlots = {})
  % Se grafica una señal dada
  %
  % ARGUMENTOS:
  % - signal: struct de la señal que se quiere graficar.
  %   signal = {mySignal}
  %   signal = {signalX, signalY}
  % - labels: struct de los nombres de los ejes y el titulo
  %   labels = {"mi titulo"}
  %   labels = {"n", "y[n]", "mi titulo"}
  %   labels = {"n", "y[n]", "mi titulo", "comentario en el consolelog"}
  % - savePlots: struct de los datos para guardar el gráfico
  %   savePlots = {savePlot, GLOBAL_FIGURES_PATH}
  %
  % RETORNO:
  % - fig: es la referencia al gráfico que se creará.

  fig = figure();

  graphLinewidth = 2;

  % Se extraen los labels y el title
  if (length(labels) == 1)
    _title = labels{1};
    _consolelogComment = cstrcat("Se grafica: '", _title, "'");
  elseif (length(labels) == 3)
    xlabel(labels{1});
    ylabel(labels{2});
    _title = labels{3};
    _consolelogComment = cstrcat("Se grafica: '", _title, "'");
  elseif (length(labels) == 4)
    xlabel(labels{1});
    ylabel(labels{2});
    _title = labels{3};
    _consolelogComment = labels{4};
  else
    help plotSignal;
    consolelog("Se esperaba que 'labels' sea un struct de longitud 1 o 3", "error");
  end
  title(_title);
  grid on;
  hold on;

  % se grafica la señal
  consolelog(_consolelogComment);
  if (length(signal) == 1)
    plot(signal{1}, "linewidth", graphLinewidth);
  elseif (length(signal) == 2)
    plot(signal{1}, signal{2}, "linewidth", graphLinewidth);
  else
    help plotSignal;
    consolelog("Se esperaba que 'signal' sea un struct de longitud 1 o 2", "error");
  end

  % TODO: guardar los gráficos

end
