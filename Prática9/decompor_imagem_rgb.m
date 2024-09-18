function decompor_imagem_rgb(imagemRGB)
    imagem = imread(imagemRGB);

    if size(imagem, 3) ~= 3
        error('A imagem deve estar no formato RGB.');
    end
    
    canalR = imagem(:,:,1); % Canal vermelho
    canalG = imagem(:,:,2); % Canal verde
    canalB = imagem(:,:,3); % Canal azul
    
    imagemVermelho = cat(3, canalR, canalR, canalR); % Tons de vermelho
    imagemVerde = cat(3, canalG, canalG, canalG);    % Tons de verde
    imagemAzul = cat(3, canalB, canalB, canalB);     % Tons de azul
    
    figure;
    subplot(1, 3, 1), imshow(imagemVermelho), title('Tons de Vermelho');
    subplot(1, 3, 2), imshow(imagemVerde), title('Tons de Verde');
    subplot(1, 3, 3), imshow(imagemAzul), title('Tons de Azul');
end