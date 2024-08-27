T = [1 0 10; 0 1 5; 0 0 1]; % Exemplo de matriz de transformação afim
[x, y] = afim(10, 5, T);
disp([x, y]); % Exibe as coordenadas transformadas
