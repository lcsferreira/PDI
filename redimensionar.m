function arquivo2 = redimensionar(arquivo1, tipo, num1, num2)
    % Ler a imagem em escala de cinza
    img = imread(arquivo1);
    if (size(img, 3) == 3)
        img = rgb2gray(img);
    end

    % Dimensões da imagem original
    [h, w] = size(img);

    % Novas dimensões
    new_h = round(h * num1);
    new_w = round(w * num2);

    % Inicializar nova imagem redimensionada
    new_img = zeros(new_h, new_w, 'like', img);

    % Interpolação por vizinho mais próximo
    if tipo == 1
        for i = 1:new_h
            for j = 1:new_w
                x = round((i - 1) / (new_h - 1) * (h - 1)) + 1;
                y = round((j - 1) / (new_w - 1) * (w - 1)) + 1;
                new_img(i, j) = img(x, y);
            end
        end
    % Interpolação bilinear
    elseif tipo == 2
        scale_x = w / new_w;
        scale_y = h / new_h;

        for i = 1:new_h
            for j = 1:new_w
                % Coordenadas na imagem original
                x = (i - 1) * scale_y + 1;
                y = (j - 1) * scale_x + 1;

                % Coordenadas dos 4 pixels mais próximos
                x1 = floor(x);
                x2 = min(x1 + 1, h);
                y1 = floor(y);
                y2 = min(y1 + 1, w);

                % Pesos
                tx = x - x1;
                ty = y - y1;

                % Valores dos pixels
                R = img(x1, y1);
                S = img(x1, y2);
                T = img(x2, y1);
                U = img(x2, y2);

                % Interpolação bilinear
                Q1 = R * (1 - ty) + S * ty;
                Q2 = T * (1 - ty) + U * ty;
                P = Q1 * (1 - tx) + Q2 * tx;

                % Atribui o valor interpolado ao pixel da nova imagem
                new_img(i, j) = P;
            end
        end
    end

    % Salvar a nova imagem
    imwrite(new_img, 'resized_barbara_bilinear.bmp');
    arquivo2 = 'resized_barbara_bilinear.bmp';
end

