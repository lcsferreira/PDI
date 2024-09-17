I = imread('male.tiff'); % Substitua pelo caminho da sua imagem
I = im2double(I); % Convertendo para double para garantir melhor precisão no processamento

I_gauss1 = imnoise(I, 'gaussian', 0, 0.01);

I_gauss2 = I + 30/255;
I_gauss2 = imnoise(I_gauss2, 'gaussian', 0, 0.01);

I_gauss3 = I + 50/255;
I_gauss3 = imnoise(I_gauss3, 'gaussian', 0, 0.05);

I_poisson = imnoise(I, 'poisson');

I_sp1 = imnoise(I, 'salt & pepper', 0.02);

I_sp2 = imnoise(I, 'salt & pepper', 0.10);

imwrite(I_sp2, 'male_com_ruido_sal_e_pimenta.jpg');

figure;
subplot(2,3,1), imshow(I_gauss1), title('Ruído Gaussiano (média 0, var 0.01)');
subplot(2,3,2), imshow(I_gauss2), title('Ruído Gaussiano (média 30, var 0.01)');
subplot(2,3,3), imshow(I_gauss3), title('Ruído Gaussiano (média 50, var 0.05)');
subplot(2,3,4), imshow(I_poisson), title('Ruído Poisson');
subplot(2,3,5), imshow(I_sp1), title('Ruído Sal-e-Pimenta (2%)');
subplot(2,3,6), imshow(I_sp2), title('Ruído Sal-e-Pimenta (10%)');
