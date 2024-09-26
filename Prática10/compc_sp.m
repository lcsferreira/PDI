function bpp = compc_sp(image_path)

    original_image = imread(image_path);
    
    [~, name, ~] = fileparts(image_path);
    output_image = [name, '_compressed.png'];
    imwrite(original_image, output_image, 'png');
    compressed_image = imread(output_image);
    
    info = imfinfo(output_image);
    file_size = info.FileSize * 8; % converter para bits
    num_pixels = numel(original_image); % número de pixels (largura * altura)
    bpp = file_size / num_pixels;
    
    if isequal(original_image, compressed_image)
        disp('As imagens de entrada e saída são idênticas.');
    else
        disp('As imagens de entrada e saída são diferentes.');
    end
    
    fprintf('Taxa de compressão (bpp): %.4f\n', bpp);
end
