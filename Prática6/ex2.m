img_reconstruida = ifft2(trans);

img_reconstruida = abs(img_reconstruida);

figure;
imshow(img_reconstruida, []);
title('Imagem Reconstruída pela Transformada de Fourier Inversa');
