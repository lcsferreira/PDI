function realce(path_imagem)
    img = imread(path_imagem);

    if size(img, 3) == 3
        img = rgb2gray(img);
    end

    %Suavize a imagem aplicando uma convolução da imagem com a máscara

    %Máscara de suavização
    mascara = [0 1 0; 1 -4 1; 0 1 0];

    % mascara = mascara / sum(mascara(:));

    [linhas, colunas] = size(img);
    [linhas_mascara, colunas_mascara] = size(mascara);

    deslocamento_linha = floor(linhas_mascara / 2);
    deslocamento_coluna = floor(colunas_mascara / 2);

    nova_img = zeros(linhas + 2 * deslocamento_linha, colunas + 2 * deslocamento_coluna);
    nova_img(deslocamento_linha + 1:linhas + deslocamento_linha, deslocamento_coluna + 1:colunas + deslocamento_coluna) = img;

    realce_extract = zeros(linhas, colunas);

    for i = 1:linhas
        for j = 1:colunas
            % extrair a submatriz 3x3 centrada em i e j
            submatriz = nova_img(i:i + 2 * deslocamento_linha, j:j + 2 * deslocamento_coluna);

            R = sum(sum(mascara .* submatriz));

            realce_extract(i, j) = R;
        end
    end

    %somar o realce com a imagem original
    realce_extract = img + realce_extract;

    figure;
    subplot(1, 2, 1);
    imshow(img);
    title('Original');

    subplot(1, 2, 2);
    imshow(uint8(realce_extract));
    title('Realcada');
end
