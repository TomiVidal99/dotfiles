function consolelog(msj, logType = 'info')
  % Función utilitaria para hacer logeos en la pantalla de la consola.
  % Uso: consolelog('Mensaje de logeo', 'warning').
  % Argumentos:
  % logType = 'info' (por defecto)
  %           'warning'
  %           'error'

  if (exist('dispc') != 2)
    disp('ERROR: dispc no está definido');
    exit;
  end

  % Selecciona el color acorde al tipo de logeo.
  switch (logType)
    case 'info'
      defaultColor = 'magenta';
    case 'warning'
      defaultColor = 'yellow';
    case 'error'
      defaultColor = 'red';
    case 'test'
      defaultColor = 'cyan';
    otherwise
      dispc(cstrcat("ERROR: logType = '", logType, "', no está disponible, intente con: 'info', 'warning', 'error'\n"), 'red');
  end

  dispc(
    cstrcat(
      '--', 
      upper(logType),
      '--> ',
      msj,
      '\n'
    ),
    defaultColor
  );

end
