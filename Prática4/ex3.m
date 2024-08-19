img = imread("barbara_gray.bmp");

if size(img, 3) == 3
    img = rgb2gray(img);
end

mascara1 = [1 2 1; 2 4 2; 1 2 1];

mascara1 = mascara1 / sum(mascara1(:));

mascara2 = [0 1 0; 1 -4 1; 0 1 0];

%Filtro passa-baixas com pesos/máscara mostrados 
mascara3 = [0 0 -4 0 0;
0 0 10 0 0;
-4 10 20 10 -4;
0 0 10 0 0;
0 0 -4 0 0;]

mascara3 = mascara3 / sum(mascara3(:));

img_suavizada = filter2(mascara1, img, 'same');
img_realcada = filter2(mascara2, img, 'same') + img;
img_filtrada = filter2(mascara3, img, 'same');

figure;
subplot(2, 2, 1);
imshow(img);
title('Original');

subplot(2, 2, 2);
imshow(uint8(img_suavizada));
title('Suavizada');

subplot(2, 2, 3);
imshow(uint8(img_realcada));
title('Realcada');

subplot(2, 2, 4);
imshow(uint8(img_filtrada));
title('Filtrada');


