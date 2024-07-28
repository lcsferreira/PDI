pkg load image;

% Leia a imagem incluindo o canal alfa
[img, map, alpha] = imread('borboleta.png');

% Encontre os pixels com cor laranja (246-127-0)
[x_orange, y_orange] = find(img(:,:,1) == 246 & img(:,:,2) == 127 & img(:,:,3) == 0);

% Encontre os pixels com cor bege (255-246-227)
[x_beige, y_beige] = find(img(:,:,1) == 255 & img(:,:,2) == 246 & img(:,:,3) == 227);

% Modifique a cor dos pixels encontrados
for i = 1:length(x_orange)
    img(x_orange(i), y_orange(i), :) = [34, 139, 34]; % Verde-Floresta
end

for i = 1:length(x_beige)
    img(x_beige(i), y_beige(i), :) = [255, 20, 147]; % Rosa-Quente
end

% Exiba a imagem modificada
figure, imshow(img), title('Imagem Modificada');

% Redimensione a imagem de acordo com o valor escolhido pelo usuário
scale_factor = input('Digite o fator de redimensionamento (por exemplo, 0.5 para metade do tamanho): ');

img_resized = imresize(img, scale_factor);
alpha_resized = imresize(alpha, scale_factor);

% Exiba a imagem redimensionada
figure, imshow(img_resized), title('Imagem Redimensionada');

% Salve a imagem redimensionada em um novo arquivo, preservando a transparência
imwrite(img_resized, 'borboleta_verde_rosa_redimensionada.png', 'Alpha', alpha_resized);

