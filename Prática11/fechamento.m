function img_fechamento = fechamento(imagem_bin, ES)
    %dilatação seguida de erosão

    img_dilatada = dilata(imagem_bin, ES);

    img_fechamento = erosao(img_dilatada, ES);

    imwrite(img_fechamento, 'imagem_fechamento.png');
end

