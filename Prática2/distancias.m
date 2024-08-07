function [D4, D8, DE, DM] = distancias(arquivo, Xp, Yp, Xq, Yq)
    img = imread(arquivo);
    
    if size(img, 3) == 3
        img = rgb2gray(img);
    end
    
    img_bin = im2bw(img);
    
    D4 = abs(Xp - Xq) + abs(Yp - Yq);
    D8 = max(abs(Xp - Xq), abs(Yp - Yq));
    DE = sqrt((Xp - Xq)^2 + (Yp - Yq)^2);
    
    [rows, cols] = size(img_bin);
    visited = false(rows, cols);
    queue = [Xp, Yp, 0];
    connected = false;
    DM = -1; 
    
    directions = [-1, 0; 1, 0; 0, -1; 0, 1; -1, -1; -1, 1; 1, -1; 1, 1];
    
    while ~isempty(queue)
        pixel = queue(1, :);
        queue(1, :) = [];
        x = pixel(1);
        y = pixel(2);
        dist = pixel(3);

        if visited(x, y)
            continue;
        end
        
        visited(x, y) = true;
        
        if x == Xq && y == Yq
            connected = true;
            DM = dist;
            break;
        end
        
        for i = 1:size(directions, 1)
            new_x = x + directions(i, 1);
            new_y = y + directions(i, 2);
            
            if new_x > 0 && new_x <= rows && new_y > 0 && new_y <= cols && img_bin(new_x, new_y) == 1 && ~visited(new_x, new_y)
                queue = [queue; new_x, new_y, dist + 1];
            end
        end
    end
    
    novo_arquivo = ['bin_' arquivo];
    imwrite(img_bin, novo_arquivo);
    
    if connected
        fprintf('Os pontos P e Q estão conectados. Distância DM: %d\n', DM);
    else
        fprintf('Os pontos P e Q não estão conectados.\n');
        DM = Inf; % Se não estão conectados, definir DM como infinito
    end
    
    disp(['Imagem binarizada salva em: ' novo_arquivo]);
end
