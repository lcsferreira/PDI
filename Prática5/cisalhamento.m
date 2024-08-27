function cisalhada = cisalhamento(imagem, cv, ch)
    img = imread(imagem);

    if size(img, 3) == 3
        img = rgb2gray(img);
    end

    T = [1 ch 0; cv 1 0; 0 0 1];

    [rows, cols] = size(img);

    img_cisalhada = zeros(rows, cols);

    for v = 1:rows
        for w = 1:cols
            [x, y] = afim(v, w, T);

            if x >= 1 && x <= rows && y >= 1 && y <= cols
                img_cisalhada(round(x), round(y)) = img(v, w);
            end
        end
    end

    img_cisalhada = uint8(img_cisalhada);

    % Gerar o nome do arquivo de saída
    [~, name, ~] = fileparts(imagem); % Extrair o nome do arquivo sem extensão
    cisalhada = ['cisalhada_' name '_' num2str(cv) '_' num2str(ch) '.png'];

    % Salvar a imagem cisalhada em um formato mais comum, como PNG
    imwrite(img_cisalhada, cisalhada);
end
