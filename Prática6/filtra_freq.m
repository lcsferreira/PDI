function img_filtrada = filtra_freq(imagem, mascara)
    img = imread(imagem);
    if size(img, 3) == 3
        img = rgb2gray(img);
    end

    img_fft = fft2(double(img));

    img_fft_shifted = fftshift(img_fft);

    espectro = log(1 + abs(img_fft_shifted));
    imwrite(mat2gray(espectro), 'espectro.png');
    figure, imshow(mat2gray(espectro)), title('Espectro de Fourier');

    img_fft_filtrada = img_fft_shifted .* double(mascara);

    img_fft_unshifted = ifftshift(img_fft_filtrada);

    img_filtrada = ifft2(img_fft_unshifted);
    img_filtrada = abs(img_filtrada);
    img_filtrada = uint8(img_filtrada);

    figure, imshow(img_filtrada), title('Imagem Filtrada');

    imwrite(img_filtrada, 'imagem_filtrada.png');

    img_filtrada = 'imagem_filtrada.png';
end

