function mascara = criar_mascara_filtro(M, N, tipo)
    % Inicializa a máscara com zeros
    mascara = zeros(M, N);

    % Define o centro da máscara
    center_x = floor(M / 2);
    center_y = floor(N / 2);

    % Calcula a distância máxima ao centro
    D0 = min(M, N) / 4; % Raio para filtros passa-baixas e rejeita-faixa

    % Cria a máscara dependendo do tipo de filtro
    switch tipo
        case 'eliminar_bordas_verticais'
            % Máscara para eliminar bordas verticais
            for u = 1:M
                for v = 1:N
                    if abs(v - center_y) < 10 % Tamanho da faixa a ser eliminada
                        mascara(u, v) = 0;
                    else
                        mascara(u, v) = 1;
                    end
                end
            end

        case 'passa_baixas'
            % Máscara passa-baixas
            for u = 1:M
                for v = 1:N
                    dist = sqrt((u - center_x)^2 + (v - center_y)^2);
                    if dist <= D0
                        mascara(u, v) = 1;
                    end
                end
            end

        case 'passa_altas'
            % Máscara passa-altas
            for u = 1:M
                for v = 1:N
                    dist = sqrt((u - center_x)^2 + (v - center_y)^2);
                    if dist > D0
                        mascara(u, v) = 1;
                    end
                end
            end

        case 'passa_faixa'
            % Máscara passa-faixa
            for u = 1:M
                for v = 1:N
                    dist = sqrt((u - center_x)^2 + (v - center_y)^2);
                    if dist > D0/2 && dist <= D0
                        mascara(u, v) = 1;
                    end
                end
            end

        case 'rejeita_faixa'
            % Máscara rejeita-faixa
            for u = 1:M
                for v = 1:N
                    dist = sqrt((u - center_x)^2 + (v - center_y)^2);
                    if dist > D0/2 && dist <= D0
                        mascara(u, v) = 0;
                    else
                        mascara(u, v) = 1;
                    end
                end
            end

        otherwise
            error('Tipo de filtro desconhecido.');
    end
end

