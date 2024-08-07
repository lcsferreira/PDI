function imfronteira = fronteira(arquivo, tipo, Xp, Yp)
    img = imread(arquivo);
    
    if size(img, 3) == 3
        img = rgb2gray(img);
    end
    
    img_bin = im2bw(img);
    
    [rows, cols] = size(img_bin);
    if Xp < 1 || Xp > rows || Yp < 1 || Yp > cols
        error('O ponto P está fora dos limites da imagem.');
    end
    
    imfronteira = zeros(rows, cols);
    
    directions = [-1, 0; 1, 0; 0, -1; 0, 1; -1, -1; -1, 1; 1, -1; 1, 1];
    
    queue = [Xp, Yp];
    visited = false(rows, cols);
    visited(Xp, Yp) = true;
    
    while ~isempty(queue)
        current_pixel = queue(1, :);
        queue(1, :) = [];
        
        x = current_pixel(1);
        y = current_pixel(2);
        
        for k = 1:size(directions, 1)
            ni = x + directions(k, 1);
            nj = y + directions(k, 2);
            
            if ni > 0 && ni <= rows && nj > 0 && nj <= cols && ~visited(ni, nj) && img_bin(ni, nj) == img_bin(Xp, Yp)
                visited(ni, nj) = true;
                queue = [queue; ni, nj];
            end
        end
    end
    
    for i = 1:rows
        for j = 1:cols
            if visited(i, j)
                is_border = false;
                
                for k = 1:size(directions, 1)
                    ni = i + directions(k, 1);
                    nj = j + directions(k, 2);
                    
                    if ni > 0 && ni <= rows && nj > 0 && nj <= cols
                        if img_bin(ni, nj) ~= img_bin(i, j)
                            is_border = true;
                            break;
                        end
                    else
                        is_border = true;
                        break;
                    end
                end
                
                if (tipo == 1 && is_border) || (tipo == 0 && ~is_border)
                    imfronteira(i, j) = 1;
                end
            end
        end
    end
    
    imfronteira = uint8(imfronteira * 255);
    
    imwrite(imfronteira, ['fronteira_' arquivo]);
end
