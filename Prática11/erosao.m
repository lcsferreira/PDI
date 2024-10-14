function img_erodida = erosao(imagem_bin, ES)
    [lin_img, col_img] = size(imagem_bin);
    [lin_es, col_es] = size(ES);
    offset_lin = floor(lin_es / 2);
    offset_col = floor(col_es / 2);
    img_erodida = ones(lin_img, col_img);

    for i = 1 + offset_lin : lin_img - offset_lin
        for j = 1 + offset_col : col_img - offset_col
            janela = imagem_bin(i - offset_lin:i + offset_lin, j - offset_col:j + offset_col);

            if all(janela(ES == 1) == 1)
                img_erodida(i, j) = 1;
            else
                img_erodida(i, j) = 0;
            end
        end
    end
end


