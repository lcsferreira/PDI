function contraste(image_name)
    % Ler a imagem
    img = imread(image_name);
    
    % Converter para tons de cinza se for uma imagem colorida
    if size(img, 3) == 3
        img = rgb2gray(img);
    end
    
    % Obter as dimensões da imagem
    [linhas, colunas] = size(img);
    
    % Calcular o histograma original
    hist_original = zeros(1, 256);
    for i = 1:linhas
        for j = 1:colunas
            hist_original(img(i, j) + 1) = hist_original(img(i, j) + 1) + 1;
        end
    end
    
    % Normalizar o histograma
    hist_original = hist_original / (linhas * colunas);
    
    % Calcular a função de distribuição acumulada (CDF)
    cdf = zeros(1, 256);
    cdf(1) = hist_original(1);
    for k = 2:256
        cdf(k) = cdf(k - 1) + hist_original(k);
    end
    
    % Realizar a equalização do histograma
    img_equalizada = zeros(linhas, colunas);
    for i = 1:linhas
        for j = 1:colunas
            img_equalizada(i, j) = round(255 * cdf(img(i, j) + 1));
        end
    end
    
    % Converter o resultado para uint8
    img_equalizada = uint8(img_equalizada);
    
    % Calcular o histograma da imagem equalizada
    hist_equalizada = zeros(1, 256);
    for i = 1:linhas
        for j = 1:colunas
            hist_equalizada(img_equalizada(i, j) + 1) = hist_equalizada(img_equalizada(i, j) + 1) + 1;
        end
    end
    
    % Normalizar o histograma da imagem equalizada
    hist_equalizada = hist_equalizada / (linhas * colunas);
    
    % Exibir as imagens original e equalizada
    figure;
    subplot(2, 2, 1);
    imshow(img);
    title('Imagem Original');
    
    subplot(2, 2, 2);
    imshow(img_equalizada);
    title('Imagem Equalizada');
    
    % Exibir os histogramas
    subplot(2, 2, 3);
    bar(0:255, hist_original, 'k');
    title('Histograma Original');
    xlim([0 255]);
    
    subplot(2, 2, 4);
    bar(0:255, hist_equalizada, 'k');
    title('Histograma Equalizado');
    xlim([0 255]);
end
