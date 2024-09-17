function figura_out = restaura_media(figura_in, N)
    I = imread(figura_in);

    if size(I, 3) == 3
        I = rgb2gray(I);
    end

    I = im2double(I);

    h = fspecial('average', [N N]);

    I_restaurada = imfilter(I, h, 'replicate');

    I_restaurada = im2uint8(I_restaurada);

    figura_out = 'img_restaurada.jpg';

    imwrite(I_restaurada, figura_out);

    figure;
    subplot(1,2,1), imshow(I), title('Imagem Original com Ruído');
    subplot(1,2,2), imshow(I_restaurada), title(['Imagem Restaurada com Filtro ', num2str(N), 'x', num2str(N)]);
end

