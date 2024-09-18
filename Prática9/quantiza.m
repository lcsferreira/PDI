function Saida = quantiza(entrada, bitsR, bitsG, bitsB)
    entrada = imread(entrada);

    if size(entrada, 3) ~= 3
        error('A imagem deve estar no formato RGB.');
    end
    
    entrada = im2double(entrada);
    
    % Extrai os canais R, G, B
    R = entrada(:,:,1);
    G = entrada(:,:,2);
    B = entrada(:,:,3);
    
    R_quant = quantiza_canal(R, bitsR);
    G_quant = quantiza_canal(G, bitsG);
    B_quant = quantiza_canal(B, bitsB);
    
    Saida = cat(3, R_quant, G_quant, B_quant);
    
    figure;
    imshow(Saida);
    title(['Quantização: R = ' num2str(bitsR) ' bits, G = ' num2str(bitsG) ' bits, B = ' num2str(bitsB) ' bits']);
    
    imwrite(Saida, ['quantizada_' num2str(bitsR) 'R_' num2str(bitsG) 'G_' num2str(bitsB) 'B.png']);
end

function canalQuantizado = quantiza_canal(canal, bits)
    niveis = 2^bits;
    
    Q = 1 / niveis; 
    canalQuantizado = floor(canal / Q) * Q + Q / 2;
end
