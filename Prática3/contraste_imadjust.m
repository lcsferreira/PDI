function contraste_imadjust(figura)
    img = imread(figura);
    
    if size(img, 3) == 3
        img = rgb2gray(img);
    end
    
    figure;
    imhist(img);
    title('Histograma da Imagem Original');
    
    img_identidade = imadjust(img, [0 1], [0 1]);
    figure;
    imhist(img_identidade);
    title('Histograma - Transformação de Intensidade Linear Identidade');
    
    % 2. Transformação de intensidade linear com ajuste (min -> max)
    min_intensidade = double(min(img(:))) / 255;
    max_intensidade = double(max(img(:))) / 255;
    img_linear_ajuste = imadjust(img, [min_intensidade max_intensidade], [0 1]);
    figure;
    imhist(img_linear_ajuste);
    title('Histograma - Transformação Linear com Ajuste (Min -> Max)');
    
    img_gama_0_5 = imadjust(img, [], [], 0.5);
    figure;
    imhist(img_gama_0_5);
    title('Histograma - Transformação com Correção Gama (Gama = 0.5)');
    
    img_gama_1 = imadjust(img, [], [], 1);
    figure;
    imhist(img_gama_1);
    title('Histograma - Transformação com Correção Gama (Gama = 1)');
    
    img_gama_2 = imadjust(img, [], [], 2);
    figure;
    imhist(img_gama_2);
    title('Histograma - Transformação com Correção Gama (Gama = 2)');
    
    figure;
    subplot(2, 3, 1);
    imshow(img);
    title('Original');
    
    subplot(2, 3, 2);
    imshow(img_identidade);
    title('Identidade');
    
    subplot(2, 3, 3);
    imshow(img_linear_ajuste);
    title('Linear Ajuste (Min -> Max)');
    
    subplot(2, 3, 4);
    imshow(img_gama_0_5);
    title('Gama 0.5');
    
    subplot(2, 3, 5);
    imshow(img_gama_1);
    title('Gama 1');
    
    subplot(2, 3, 6);
    imshow(img_gama_2);
    title('Gama 2');
end
