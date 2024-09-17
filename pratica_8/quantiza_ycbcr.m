function figura_quantizada = quantiza_ycbcr(figura_in, bits_Y, bits_Cb, bits_Cr)
    I_rgb = imread(figura_in);

    if size(I_rgb, 3) == 1
        error('A imagem fornecida está em escala de cinza. Use uma imagem RGB para este exercício.');
    end

    I_ycbcr = rgb2ycbcr(I_rgb);

    Y  = I_ycbcr(:,:,1);
    Cb = I_ycbcr(:,:,2);
    Cr = I_ycbcr(:,:,3);

    Y_quantizado = quantiza_canal(Y, bits_Y);

    Cb_quantizado = quantiza_canal(Cb, bits_Cb);

    Cr_quantizado = quantiza_canal(Cr, bits_Cr);

    I_ycbcr_quantizado = cat(3, Y_quantizado, Cb_quantizado, Cr_quantizado);

    figura_quantizada = ycbcr2rgb(I_ycbcr_quantizado);

    figure;
    subplot(1,2,1), imshow(I_rgb), title('Imagem Original');
    subplot(1,2,2), imshow(figura_quantizada), title(['Imagem Quantizada (', num2str(bits_Y), ' bits Y, ', num2str(bits_Cb), ' bits Cb, ', num2str(bits_Cr), ' bits Cr)']);

    imwrite(figura_quantizada, 'imagem_quantizada.jpg');
end

function canal_quantizado = quantiza_canal(canal, bits)
    max_val = 255; 
    n_niveis = 2^bits; 
    step = max_val / (n_niveis - 1);

    canal_quantizado = round(canal / step) * step;
    canal_quantizado = uint8(canal_quantizado);
end

