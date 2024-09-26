function PSNR = CPSNR(imagem1, imagem2)
    img1 = imread(imagem1);
    img2 = imread(imagem2);
    
    if size(img1) ~= size(img2)
        error('As imagens devem ter o mesmo tamanho.');
    end
    
    diff = double(img1) - double(img2);
    
    mse = mean(diff(:).^2);
    
    MAXI = 255;
    
    if mse == 0
        PSNR = Inf;
    else
        PSNR = 10 * log10((MAXI^2) / mse);
    end
    
    if isequal(img1, img2)
        disp('As imagens de entrada e saída são idênticas.');
    else
        disp('As imagens de entrada e saída são diferentes.');
    end
end
