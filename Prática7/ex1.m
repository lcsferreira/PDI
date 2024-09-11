function [mse, psnr] = calcular_mse_psnr()
    img1 = imread('imagem_filtrada.png');
    img2 = imread('lena.bmp');

    if size(img1) ~= size(img2)
        error('As imagens devem ter a mesma resolução.');
    end

    img1 = double(img1);
    img2 = double(img2);

    mse = mean((img1(:) - img2(:)).^2);

    max_val = 255;
    psnr = 10 * log10((max_val^2) / mse);

    fprintf('MSE: %.4f\n', mse);
    fprintf('PSNR: %.4f dB\n', psnr);
end
