% Nombres de los archivos divididos
archivo1 = 'P16_crecg_1.dat';
archivo2 = 'P16_crecg_2.dat';

% Nombre del archivo de salida (archivo unido)
archivoSalida = 'P16_crecg_Join.dat';

% Abrir el primer archivo en modo binario para lectura
fid1 = fopen(archivo1, 'rb');
if fid1 == -1
    error('No se pudo abrir el archivo: %s', archivo1);
end

% Leer todo el contenido del primer archivo
contenido1 = fread(fid1, Inf, 'uint8');
fclose(fid1);

% Abrir el segundo archivo en modo binario para lectura
fid2 = fopen(archivo2, 'rb');
if fid2 == -1
    error('No se pudo abrir el archivo: %s', archivo2);
end

% Leer todo el contenido del segundo archivo
contenido2 = fread(fid2, Inf, 'uint8');
fclose(fid2);

% Abrir un nuevo archivo para escritura donde unirás los dos archivos
fidSalida = fopen(archivoSalida, 'wb');
if fidSalida == -1
    error('No se pudo crear el archivo de salida.');
end

% Escribir el contenido del primer archivo en el archivo de salida
fwrite(fidSalida, contenido1, 'uint8');

% Escribir el contenido del segundo archivo en el archivo de salida
fwrite(fidSalida, contenido2, 'uint8');

% Cerrar el archivo de salida
fclose(fidSalida);

disp('Los archivos han sido unidos exitosamente en P16_crecg_Join.dat');
