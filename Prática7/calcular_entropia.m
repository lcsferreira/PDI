function H = calcular_entropia(imagem)
    img = imread(imagem);

    if size(img, 3) ~= 1
        error('A imagem deve estar em escala de cinza.');
    end

    img = double(img);

    num_pixels = numel(img);

    [contagem, ~] = hist(img(:), 0:255);

    prob = contagem / num_pixels;

    prob = prob(prob > 0); % Remove probabilidades zero
    H = -sum(prob .* log2(prob));

    fprintf('Entropia da imagem: %.4f bits/pixel\n', H);
end
