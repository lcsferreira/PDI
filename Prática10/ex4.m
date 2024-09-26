qualidades = [0, 20, 40, 60, 80, 100];

bpp_values = zeros(1, length(qualidades));
psnr_values = zeros(1, length(qualidades));

imagem_original = 'lena.bmp';

for i = 1:length(qualidades)
    qualidade = qualidades(i);
    [bpp, PSNR] = compc_cp(imagem_original, qualidade);
    bpp_values(i) = bpp;
    psnr_values(i) = PSNR;
end

figure;
plot(bpp_values, psnr_values, '-o', 'LineWidth', 2);
xlabel('Taxa de Compressão (bpp)');
ylabel('Distorção (PSNR em dB)');
title('Curva Taxa vs Distorção');
grid on;

for i = 1:length(qualidades)
    text(bpp_values(i), psnr_values(i), sprintf('(%0.2f, %0.2f)', bpp_values(i), psnr_values(i)), 'VerticalAlignment', 'bottom');
end
