% Nome do arquivo da imagem em escala de cinza
arquivo = 'boat.512.tiff';

% Coordenadas dos pixels P e Q
Xp = 10;
Yp = 15;
Xq = 30;
Yq = 35;

% Chamar a função distancias
[D4, D8, DE, DM] = distancias(arquivo, Xp, Yp, Xq, Yq);

% Exibir os resultados
fprintf('D4: %d\n', D4);
fprintf('D8: %d\n', D8);
fprintf('DE: %f\n', DE);
fprintf('DM: %d\n', DM);
