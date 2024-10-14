function img_abertura = abertura(imagem_bin, ES)
    %erosão seguida de dilatação
    img_erosionada = erosao(imagem_bin, ES);

    img_abertura = dilata(img_erosionada, ES);

    imwrite(img_abertura, 'imagem_abertura.png');
end

