function Saida = rgbtohsi(entrada)
    entrada = imread(entrada);
    if size(entrada, 3) ~= 3
        error('A imagem deve estar no formato RGB.');
    end
    
    entrada = im2double(entrada);
    
    R = entrada(:,:,1);
    G = entrada(:,:,2);
    B = entrada(:,:,3);
    
    I = (R + G + B) / 3;
    
    minRGB = min(min(R, G), B);
    S = 1 - (3 ./ (R + G + B + eps)) .* minRGB;
    
    num = 0.5 * ((R - G) + (R - B));
    den = sqrt((R - G).^2 + (R - B).*(G - B));
    theta = acos(num ./ (den + eps));
    
    H = theta; % Inicialmente, H é igual a theta
    
    % Ajuste para quando B > G
    H(B > G) = 2 * pi - H(B > G);
    
    % Normaliza H para o intervalo [0, 1]
    H = H / (2 * pi);
    
    % Exibe os canais H, S e I individualmente
    figure;
    subplot(1, 3, 1), imshow(H), title('Matiz (H)');
    subplot(1, 3, 2), imshow(S), title('Saturação (S)');
    subplot(1, 3, 3), imshow(I), title('Intensidade (I)');
    
    Saida = cat(3, H, S, I);
    figure;
    imshow(Saida), title('Imagem no Espaço de Cores HSI');

end
