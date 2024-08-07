% Nome do arquivo da imagem em escala de cinza
arquivo = 'boat.512.tiff';

% Tipo de fronteira (interna=0, externa=1)
tipo = 0;

% Coordenadas do pixel P
Xp = 10;
Yp = 15;

% Chamar a função fronteira
imfronteira = fronteira(arquivo, tipo, Xp, Yp);

% Exibir a imagem de fronteira
imshow(imfronteira);

