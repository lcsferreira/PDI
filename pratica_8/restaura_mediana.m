function figura_out = restaura_mediana(figura_in, N)
    % Carregar a imagem com ruído sal e pimenta
    I = imread(figura_in);

    % Converter para escala de cinza, se a imagem for RGB
    if size(I, 3) == 3
        I = rgb2gray(I);
    end

    % Converter para double para maior precisão nos cálculos
    I = im2double(I);

    % Aplicar o filtro de mediana de tamanho NxN
    I_restaurada = medfilt2(I, [N N]);

    % Converter a imagem de volta para uint8 para salvá-la corretamente
    I_restaurada = im2uint8(I_restaurada);

    % Nome do arquivo de saída
    figura_out = 'img_restaurada.jpg';

    % Salvar a imagem restaurada
    imwrite(I_restaurada, figura_out);

    % Exibir a imagem original e a restaurada
    figure;
    subplot(1,2,1), imshow(I), title('Imagem Original com Ruído');
    subplot(1,2,2), imshow(I_restaurada), title(['Imagem Restaurada com Filtro Mediana ', num2str(N), 'x', num2str(N)]);

    % Retornar o nome do arquivo gerado
end

