function figura_quantizada = quantiza_ycbcr(figura_in, bits_Y, bits_Cb, bits_Cr)
    % 1. Ler a imagem de entrada
    I_rgb = imread(figura_in);

    % Verificar se a imagem é colorida ou em escala de cinza
    if size(I_rgb, 3) == 1
        error('A imagem fornecida está em escala de cinza. Use uma imagem RGB para este exercício.');
    end

    % 2. Converter de RGB para YCbCr
    I_ycbcr = rgb2ycbcr(I_rgb);

    % 3. Salvar os canais Y, Cb, Cr em três matrizes separadas
    Y  = I_ycbcr(:,:,1);
    Cb = I_ycbcr(:,:,2);
    Cr = I_ycbcr(:,:,3);

    % 4. Realizar quantização separadamente para cada canal de acordo com o número de bits
    % Quantização para Y (luminância)
    Y_quantizado = quantiza_canal(Y, bits_Y);

    % Quantização para Cb (crominância azul)
    Cb_quantizado = quantiza_canal(Cb, bits_Cb);

    % Quantização para Cr (crominância vermelha)
    Cr_quantizado = quantiza_canal(Cr, bits_Cr);

    % 5. Combinar os canais quantizados em uma nova imagem YCbCr
    I_ycbcr_quantizado = cat(3, Y_quantizado, Cb_quantizado, Cr_quantizado);

    % 6. Retornar a imagem resultante ao espaço de cores RGB
    figura_quantizada = ycbcr2rgb(I_ycbcr_quantizado);

    % 7. Apresentar e salvar a imagem quantizada
    figure;
    subplot(1,2,1), imshow(I_rgb), title('Imagem Original');
    subplot(1,2,2), imshow(figura_quantizada), title(['Imagem Quantizada (', num2str(bits_Y), ' bits Y, ', num2str(bits_Cb), ' bits Cb, ', num2str(bits_Cr), ' bits Cr)']);

    % Salvar a imagem quantizada
    imwrite(figura_quantizada, 'imagem_quantizada.jpg');
end

% Função auxiliar para quantizar um canal específico de acordo com os bits fornecidos
function canal_quantizado = quantiza_canal(canal, bits)
    % Definir os níveis de quantização com base no número de bits
    max_val = 255; % Valor máximo para uma imagem 8-bit
    n_niveis = 2^bits; % Número de níveis de quantização
    step = max_val / (n_niveis - 1); % Tamanho do passo entre os níveis

    % Quantizar o canal
    canal_quantizado = round(canal / step) * step;
    canal_quantizado = uint8(canal_quantizado); % Converter de volta para uint8
end

