function [bpp, PSNR] = compc_cp(imagem, qualidade)
    img_original = imread(imagem);
    
    if qualidade < 0 || qualidade > 100
        error('A qualidade deve estar entre 0 e 100.');
    end
    
    imwrite(img_original, 'imagem_compactada.jpg', 'Quality', qualidade);
    
    img_compactada = imread('imagem_compactada.jpg');
    
    figure;
    imshow(img_compactada);
    title(['Imagem Compactada com Qualidade: ' num2str(qualidade)]);
    
    info_original = imfinfo(imagem);
    info_compactada = imfinfo('imagem_compactada.jpg');
    
    tamanho_original = info_original.FileSize * 8; % em bits
    tamanho_compactado = info_compactada.FileSize * 8; % em bits
    
    num_pixels = size(img_original, 1) * size(img_original, 2); % altura x largura
    
    bpp = tamanho_compactado / num_pixels;
    
    mse = mean((double(img_original(:)) - double(img_compactada(:))).^2);
    MAXI = 255;
    
    if mse == 0
        PSNR = Inf; % Se as imagens são idênticas
    else
        PSNR = 10 * log10((MAXI^2) / mse);
    end
end
