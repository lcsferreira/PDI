function [x, y] = afim(v, w, T)
    entrada = [v-1; w-1; 1];

    saida = T * entrada;

    x = saida(1) + 1;
    y = saida(2) + 1;
end
